import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'privacy_policy_model.dart';
export 'privacy_policy_model.dart';

class PrivacyPolicyWidget extends StatefulWidget {
  const PrivacyPolicyWidget({Key? key}) : super(key: key);

  @override
  _PrivacyPolicyWidgetState createState() => _PrivacyPolicyWidgetState();
}

class _PrivacyPolicyWidgetState extends State<PrivacyPolicyWidget> {
  late PrivacyPolicyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PrivacyPolicyModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).accent4,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).info,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            'سياسة الخصوصية ',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 22.0,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'شكرا لك على استخدام تطبيق الخدمات القائمة على الموقع (LBS). توضح سياسة الخصوصية هذه كيفية جمع معلوماتك الشخصية واستخدامها وحمايتها فيما يتعلق باستخدام تقويم Google لتخصيص تجربة المستخدم الخاصة بك. باستخدام تطبيقنا ، فإنك توافق على شروط سياسة الخصوصية هذه.\n\n1. المعلومات التي نجمعها:\n\nأ. المعلومات الشخصية: لتحسين تجربة المستخدم الخاصة بك ، قد يطلب تطبيقنا الوصول إلى بيانات تقويم Google الخاصة بك ، بما في ذلك تفاصيل الحدث ومعلومات الموقع وإعدادات التقويم. نحن نجمع هذه المعلومات فقط بموافقتك الصريحة ، ولا نخزن بيانات تقويم Google الخاصة بك على خوادمنا.\n\nب. معلومات الاستخدام: قد نقوم بجمع معلومات استخدام معينة تلقائيا عندما تتفاعل مع تطبيقنا. قد يتضمن ذلك معلومات مثل معلومات الجهاز وعنوان IP وبيانات أداء التطبيق وأنماط الاستخدام. يتم جمع هذه البيانات لتحسين وظائف تطبيقنا وتوفير تجربة مستخدم أفضل.\n\n2. استخدام المعلومات:\n\nأ. التخصيص: نستخدم المعلومات التي تم جمعها من تقويم Google لتخصيص تجربة المستخدم داخل تطبيق \"دعم المتصفحات القديمة\". يتضمن ذلك تقديم اقتراحات وتذكيرات وإشعارات مخصصة استنادا إلى أحداث التقويم وبيانات الموقع والتفضيلات.\n\nب. تحسين الخدمة: قد نقوم بتحليل معلومات الاستخدام لتحسين وتحسين أداء تطبيقنا وميزاته ومحتواه. يساعدنا هذا في فهم كيفية تفاعل المستخدمين مع تطبيقنا ويسمح لنا بإجراء تحسينات للحصول على تجربة مستخدم أفضل.\n\nج. التواصل: قد نستخدم معلومات الاتصال الخاصة بك ، مثل عنوان بريدك الإلكتروني ، لنرسل لك تحديثات وإشعارات ومعلومات مهمة تتعلق بتطبيقنا. يمكنك إلغاء الاشتراك في هذه الاتصالات في أي وقت.\n\n \n4. أمن البيانات:\n\na. نحن نتخذ تدابير معقولة لحماية معلوماتك الشخصية من الوصول غير المصرح به أو التغيير أو الكشف. ومع ذلك ، لا توجد طريقة نقل عبر الإنترنت أو التخزين الإلكتروني آمنة بنسبة 100٪ ، ولا يمكننا ضمان الأمان المطلق.\n\nb. نحن نقصر الوصول إلى المعلومات الشخصية على الأفراد المصرح لهم الذين يحتاجون إلى معرفة تلك المعلومات لتشغيل تطبيقنا أو تطويره أو تحسينه. نحن نتبع الممارسات المتوافقة مع معايير الصناعة لحماية معلوماتك الشخصية.\n\n6. التغييرات في سياسة الخصوصية هذه:\n\nنحتفظ بالحق في تحديث أو تعديل سياسة الخصوصية هذه في أي وقت. ستكون أي تغييرات سارية فور نشر سياسة الخصوصية المحدثة على تطبيقنا. نشجعك على مراجعة سياسة الخصوصية هذه بشكل دوري لمعرفة أي تحديثات.\n\nباستخدام تطبيق \"دعم المتصفحات القديمة\" ومنح حق الوصول إلى تقويم Google، فإنك تقر بأنك قد قرأت وفهمت سياسة الخصوصية هذه وتوافق على جمع معلوماتك الشخصية واستخدامها والكشف عنها كما هو موضح هنا.\n',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        color: Color(0xFF12151C),
                        fontSize: 14.0,
                        fontWeight: FontWeight.normal,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
