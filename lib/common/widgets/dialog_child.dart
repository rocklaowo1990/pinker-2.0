import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinker/common/api/library.dart';
import 'package:pinker/common/constant/storage.dart';
import 'package:pinker/common/data/library.dart';
import 'package:pinker/common/global/library.dart';
import 'package:pinker/common/services/storage.dart';
import 'package:pinker/common/style/library.dart';
import 'package:pinker/common/widgets/library.dart';

class DialogChild extends StatelessWidget {
  const DialogChild({
    Key? key,
    required this.child,
    this.isAutoBack = true,
  }) : super(key: key);

  final Widget child;
  final bool isAutoBack;

  static DialogChild oneButton({
    required String title,
    required String content,
    String buttonText = '确认',
    void Function()? onTap,
  }) {
    var titleBox = MyText.gray18(title);

    var contentBox = MyText(content);

    var sureButton = MyButton(
      width: double.infinity,
      height: 50,
      child: MyText.primary(buttonText),
      onTap: onTap,
    );

    var contentBody = Padding(
      padding: const EdgeInsets.only(top: 40, bottom: 40, left: 20, right: 20),
      child: Column(
        children: [titleBox, const SizedBox(height: 20), contentBox],
      ),
    );

    var bodyChild = Column(
      children: [
        contentBody,
        Container(height: 1, color: MyColors.line),
        sureButton,
      ],
    );

    var child = Container(
      child: bodyChild,
      width: Get.width - 80,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        color: MyColors.secondBackground,
        borderRadius: MyStyle.borderRadius,
        shape: BoxShape.rectangle,
      ),
    );

    return DialogChild(child: child);
  }

  static DialogChild signIn({
    void Function()? loginCallBack,
    void Function()? registerCallBack,
    void Function()? forgotCallBack,
  }) {
    final accountController = TextEditingController();
    final accountFocusNode = FocusNode();
    final passwordController = TextEditingController();
    final passwordFocusNode = FocusNode();

    final isLoading = false.obs;
    final isOnTap = false.obs;
    final obscureText = true.obs;

    void linster() {
      if (accountController.text.isEmpty || passwordController.text.isEmpty) {
        isOnTap.value = false;
      } else {
        isOnTap.value = true;
      }
    }

    accountController.addListener(linster);
    passwordController.addListener(linster);

    void signIn() async {
      isLoading.value = true;
      isOnTap.value = false;

      var _signIn = await AccountApi.signIn(
        account: accountController.text,
        password: passwordController.text,
        errorCallBack: ConfigController.to.errorSnakBar,
      );

      if (_signIn == null || _signIn.code != 200) {
        isLoading.value = false;
        isOnTap.value = true;
        return;
      }

      var _getUserInfo = await UserApi.getUserInfo(
        errorCallBack: ConfigController.to.errorSnakBar,
      );

      if (_getUserInfo == null || _getUserInfo.code != 200) {
        isLoading.value = false;
        isOnTap.value = true;
        return;
      }

      var _getHomeSexList = await ResourceApi.getResourceList(
        pageNo: 1,
        type: 4,
        pageSize: 15,
        errorCallBack: ConfigController.to.errorSnakBar,
      );

      if (_getHomeSexList == null || _getHomeSexList.code != 200) {
        isLoading.value = false;
        isOnTap.value = true;
        return;
      }

      UserController.to.token = _signIn.data['token'];
      await MyStorageService.to.setString(
        storageUserTokenKey,
        UserController.to.token,
      );

      var userInfo = UserInfo.fromJson(_getUserInfo.data);
      UserController.to.userInfo.value = userInfo;
      UserController.to.userInfo.update((val) {});

      var homeSexList = ResourceDataList.fromJson(_getHomeSexList.data);
      ResourceController.to.homeSexList.value = homeSexList;
      ResourceController.to.homeSexList.update((val) {});

      Get.back();
      ConfigController.to.getSnakBar('操作成功', '您已成功登陆');
    }

    var closeButtonChildren = [
      const Spacer(),
      Obx(() => MyButton.close(
          onTap: isLoading.value ? null : () => Get.back(), size: 20)),
      const SizedBox(width: 10),
    ];

    var accountInput = Obx(() => MyInput(
          controller: accountController,
          focusNode: accountFocusNode,
          autofocus: true,
          hintText: '账号',
          width: Get.width - 80 - 40,
          enabled: !isLoading.value,
          textInputAction: TextInputAction.next,
        ));

    Widget passwordObxBuild() {
      Widget suffixIconObxBuild() {
        var icon = obscureText.value ? Icons.visibility : Icons.visibility_off;
        return MyButton(
          child: Icon(icon, color: MyColors.primary, size: 16),
          onTap: () => obscureText.value = !obscureText.value,
        );
      }

      return MyInput(
        controller: passwordController,
        focusNode: passwordFocusNode,
        autofocus: true,
        hintText: '密码',
        obscureText: obscureText.value,
        width: Get.width - 80 - 40,
        enabled: !isLoading.value,
        suffixIcon: Obx(suffixIconObxBuild),
        textInputAction: TextInputAction.go,
        onSubmitted: isOnTap.value ? (text) => signIn() : null,
      );
    }

    var passwordInput = Obx(passwordObxBuild);

    var signInButton = Obx(() {
      var text = MyText(
        '登陆',
        color: isOnTap.value ? MyColors.text : MyColors.secondText,
      );

      var loading = SizedBox(
        width: 16,
        height: 16,
        child: MyIcons.loading(),
      );
      return MyButton(
        child: isLoading.value ? loading : text,
        color: isOnTap.value ? MyColors.primary : MyColors.enable,
        width: Get.width - 80 - 40,
        height: 35,
        onTap: isOnTap.value ? signIn : null,
      );
    });

    var forgotButton = MyButton(
      child: const MyText('忘记密码', lineHeight: 1.5),
      onTap: isLoading.value ? null : () {},
    );

    var signUpButton = MyButton(
      child: const MyText('注册账号', lineHeight: 1.5),
      onTap: isLoading.value ? null : () {},
    );

    var forgotAndSignUp = Row(
      children: [
        const SizedBox(width: 25),
        signUpButton,
        const Spacer(),
        forgotButton,
        const SizedBox(width: 25),
      ],
    );

    var bodyChild = Column(
      children: [
        const SizedBox(height: 10),

        /// 关闭按钮
        Row(children: closeButtonChildren),

        /// 标题
        MyText.text20('登陆'),

        const SizedBox(height: 32),

        /// 账号输入框
        accountInput,

        const SizedBox(height: 5),

        /// 密码输入框
        passwordInput,

        const SizedBox(height: 32),

        /// 登陆那妞
        signInButton,

        const SizedBox(height: 10),

        /// 注册和忘记密码
        forgotAndSignUp,

        const SizedBox(height: 32),
      ],
    );

    const decoration = BoxDecoration(
      color: MyColors.secondBackground,
      borderRadius: MyStyle.borderRadius,
      shape: BoxShape.rectangle,
    );

    var child = Container(
      child: bodyChild,
      width: Get.width - 80,
      clipBehavior: Clip.antiAlias,
      decoration: decoration,
    );

    return DialogChild(child: child, isAutoBack: false);
  }

  static DialogChild loading() {
    var child = MyButton(
      child: MyIcons.loading(),
      width: 80,
      height: 80,
      color: MyColors.input,
    );
    return DialogChild(
      child: child,
      isAutoBack: false,
    );
  }

  static DialogChild alert({
    required String title,
    required String content,
    void Function()? onTap,
  }) {
    void back() {
      Get.back();
      // MyHttp().cancelToken.cancel();
    }

    var titleBox = MyText.text20(title);

    var contentBox = MyText(content);

    var cancelButton = MyButton(
      width: double.infinity,
      height: 50,
      onTap: back,
      child: const MyText('取消'),
    );

    var sureButton = MyButton(
      width: double.infinity,
      height: 50,
      child: MyText.primary('确认'),
      onTap: onTap,
    );

    var contentBody = Padding(
      padding: const EdgeInsets.only(top: 40, bottom: 40, left: 20, right: 20),
      child: Column(
        children: [titleBox, const SizedBox(height: 20), contentBox],
      ),
    );

    var buttons = Row(
      children: [
        Expanded(child: cancelButton),
        Container(width: 1, height: 32, color: MyColors.line),
        Expanded(child: sureButton),
      ],
    );

    var body = Column(
      children: [
        contentBody,
        Container(height: 1, color: MyColors.line),
        buttons,
      ],
    );

    var child = Container(
      child: body,
      width: Get.width - 80,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        color: MyColors.secondBackground,
        borderRadius: MyStyle.borderRadius,
        shape: BoxShape.rectangle,
      ),
    );

    return DialogChild(child: child);
  }

  @override
  Widget build(BuildContext context) {
    void back() => Get.back();

    var button = MyButton(
      width: Get.width,
      height: Get.height,
      onTap: isAutoBack ? back : null,
    );

    var body = SizedBox(
      width: Get.width,
      height: Get.height,
      child: Column(children: [const Spacer(), child, const Spacer()]),
    );

    return Scaffold(
      body: Stack(children: [button, body]),
      backgroundColor: MyColors.background88,
    );
  }
}
