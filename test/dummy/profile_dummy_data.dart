import 'package:dio/dio.dart';
import 'package:elevate_super_fitness/api/mapper/profile_mapper.dart';
import 'package:elevate_super_fitness/api/models/requests/change_password_request_dto.dart';
import 'package:elevate_super_fitness/api/models/responses/change_password_response_dto.dart';
import 'package:elevate_super_fitness/api/models/responses/logout_response_dto.dart';
import 'package:elevate_super_fitness/api/models/responses/user_dto.dart';
import 'package:elevate_super_fitness/api/models/responses/user_info_dto.dart';
import 'package:elevate_super_fitness/domain/entites/change_password_response_entity.dart';
import 'package:elevate_super_fitness/domain/entites/help_response_entity.dart';
import 'package:elevate_super_fitness/domain/entites/help_section_response_entity.dart';
import 'package:elevate_super_fitness/domain/entites/logout_response_entity.dart';
import 'package:elevate_super_fitness/domain/entites/privacy_policy_response_entity.dart';
import 'package:elevate_super_fitness/domain/entites/requests/change_password_request_entity.dart';
import 'package:elevate_super_fitness/domain/entites/security_roles_config_entity.dart';
import 'package:elevate_super_fitness/domain/entites/user_info_entity.dart';

abstract class ProfileDummyData {
  static const dummyUserDto = UserDto(
    id: "user_123456",
    firstName: "Ahmed",
    lastName: "Mutt",
    email: "ahmedmutti22@gmail.com",
    gender: "male",
    age: 25,
    weight: 75.5,
    height: 180.2,
    activityLevel: "active",
    goal: "muscle gain",
    photo: "https://example.com/images/ahmed_profile.jpg",
    createdAt: "2025-10-29T12:00:00Z",
  );

  static const dummyUserInfoDto = UserInfoDto(
    message: "User fetched successfully",
    user: dummyUserDto,
  );

  static const dummyUserInfoEntity = UserInfoEntity(
    message: "User fetched successfully",
    id: "user_123456",
    firstName: "Ahmed",
    lastName: "Mutt",
    email: "ahmedmutti22@gmail.com",
    gender: "male",
    age: 25,
    weight: 75.5,
    height: 180.2,
    activityLevel: "active",
    goal: "muscle gain",
    photo: "https://example.com/images/ahmed_profile.jpg",
    createdAt: "2025-10-29T12:00:00Z",
  );

  // 🧩 Dummy exception examples
  static final dummyDioException = DioException(
    requestOptions: RequestOptions(path: '/user'),
    // type: DioExceptionType.connectionTimeout,
    message: "dio_error",
  );

  static final dummyException = Exception("Generic exception");
  static const dummyUserInfoEntityEmpty = UserInfoEntity(
    message: "No user data found",
    id: null,
    firstName: null,
    lastName: null,
    email: null,
    gender: null,
    age: null,
    weight: null,
    height: null,
    activityLevel: null,
    goal: null,
    photo: null,
    createdAt: null,
  );
  static final dummyUserInfoDtoMappedToEntity = dummyUserInfoDto.toEntity();
  static const dummyChangePasswordResponseDto = ChangePasswordResponseDto(
    message: "success",
    token:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6Ikp.eyJ1c2VyIjoiNjkwYTAwOGU5NzYyZjQ1ZTJhOTkyNTNiIiwiaWF0IjoxNzYyMjYzMjM3fQ.e65f7-3ej7gXiapRiNZKtaDXOUSbgj07Siys6_LMuO4",
  );

  static const dummyChangePasswordResponseEntity = ChangePasswordResponseEntity(
    message: "success",
    token:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6Ikp.eyJ1c2VyIjoiNjkwYTAwOGU5NzYyZjQ1ZTJhOTkyNTNiIiwiaWF0IjoxNzYyMjYzMjM3fQ.e65f7-3ej7gXiapRiNZKtaDXOUSbgj07Siys6_LMuO4",
  );

  static const dummyChangePasswordRequestEntity = ChangePasswordRequestEntity(
    password: "Ahmed@123",
    newPassword: "Ahmed@1234",
  );
  static const dummyChangePasswordRequestDto = ChangePasswordRequestDto(
    password: "Ahmed@123",
    newPassword: "Ahmed@1234",
  );
  static const dummyLogoutResponseDto = LogoutResponseDto(
    message: "Logout successful",
  );
  static const dummyLogoutResponseEntity = LogoutResponseEntity(
    message: "Logout successful",
  );

  static final dummySecurityRolesConfigResponseEntity =
      const SecurityRolesConfigResponseEntity(
        securityRolesConfig: [
          SecurityRoleSectionEntity(
            section: "page_title",
            content: {
              "en": "User Roles & Permissions",
              "ar": "أدوار وصلاحيات المستخدمين",
            },
            style: {
              "fontSize": 24,
              "fontWeight": "bold",
              "color": "#333333",
              "textAlign": {"en": "left", "ar": "right"},
              "backgroundColor": "#FFFFFF",
            },
          ),
          SecurityRoleSectionEntity(
            section: "role_definition",
            roleId: "super_admin",
            name: {"en": "Super Admin", "ar": "المدير العام (سوبر أدمن)"},
            description: {
              "en": "Full, unrestricted access to all system settings.",
              "ar": "وصول كامل وغير مقيد لجميع إعدادات النظام.",
            },
            style: {"highlightColor": "#8B0000", "fontWeight": "bold"},
            permissions: [
              PermissionEntity(
                key: "system.config.write",
                name: {
                  "en": "Modify System Configuration",
                  "ar": "تعديل إعدادات النظام",
                },
                description: {
                  "en": "Can change application settings.",
                  "ar": "يمكنه تغيير إعدادات التطبيق.",
                },
              ),
              PermissionEntity(
                key: "user.all.full",
                name: {
                  "en": "Full User Management",
                  "ar": "إدارة كاملة للمستخدمين",
                },
                description: {
                  "en": "Can create, read, update, and delete users.",
                  "ar": "يمكنه إنشاء، قراءة، تحديث، وحذف المستخدمين.",
                },
              ),
            ],
          ),
          SecurityRoleSectionEntity(
            section: "role_definition",
            roleId: "viewer",
            name: {"en": "Viewer", "ar": "مشاهد"},
            description: {
              "en": "Read-only access to content and dashboards.",
              "ar": "وصول للقراءة فقط إلى المحتوى ولوحات المعلومات.",
            },
            style: {"highlightColor": "#808080", "fontWeight": "normal"},
            permissions: [
              PermissionEntity(
                key: "content.read",
                name: {"en": "Read Content", "ar": "قراءة المحتوى"},
                description: {
                  "en": "Can view all published content.",
                  "ar": "يمكنه عرض كل المحتوى المنشور.",
                },
              ),
            ],
          ),
        ],
      );
  static final dummyPrivacyPolicyEntity = const PrivacyPolicyResponseEntity(
    privacyPolicy: [
      PrivacySectionEntity(
        section: "title",
        content: {"en": "Privacy Policy", "ar": "سياسة الخصوصية"},
        style: {
          "fontSize": 24,
          "fontWeight": "bold",
          "color": "#333333",
          "textAlign": {"en": "center", "ar": "center"},
          "backgroundColor": "#FFFFFF",
        },
      ),
      PrivacySectionEntity(
        section: "information_collection",
        title: {
          "en": "1. Information We Collect",
          "ar": "1. المعلومات التي نجمعها",
        },
        style: {
          "title": {
            "fontSize": 18,
            "fontWeight": "bold",
            "color": "#8B0000",
            "textAlign": {"en": "left", "ar": "right"},
            "backgroundColor": "#FFFFFF",
          },
        },
        subSections: [
          PrivacySubSectionEntity(
            type: "paragraph",
            title: {
              "en": "A. Personal Data You Provide",
              "ar": "أ. البيانات الشخصية التي تقدمها",
            },
            content: {
              "en":
                  "We collect information you provide directly to us, such as when you create an account or contact support.",
              "ar":
                  "نحن نجمع المعلومات التي تقدمها لنا مباشرة، مثل عند إنشاء حساب أو الاتصال بالدعم.",
            },
          ),
        ],
      ),
      PrivacySectionEntity(
        section: "data_security",
        title: {"en": "4. Data Security", "ar": "4. أمن البيانات"},
        content: {
          "en": ["We implement security measures to protect your information."],
          "ar": ["نحن نطبق تدابير أمنية لحماية معلوماتك."],
        },
      ),
    ],
  );
  static final dummyHelpResponseEntity = const HelpResponseEntity(
    helpScreenContent: [
      HelpSectionEntity(
        section: "page_title",
        content: {"en": "Help & Support", "ar": "المساعدة والدعم"},
        style: {
          "fontSize": 24,
          "fontWeight": "bold",
          "color": "#333333",
          "textAlign": {"en": "center", "ar": "center"},
          "backgroundColor": "#FFFFFF",
        },
      ),
      HelpSectionEntity(
        section: "faq",
        title: {"en": "Frequently Asked Questions", "ar": "الأسئلة الشائعة"},
        style: {
          "title": {
            "fontSize": 20,
            "fontWeight": "bold",
            "color": "#8B0000",
            "textAlign": {"en": "left", "ar": "right"},
            "backgroundColor": "#F5F5F5",
          },
        },
        content: [
          {
            "id": "faq_001",
            "question": {
              "en": "How does the AI Trainer 'Apex' work?",
              "ar": "كيف يعمل المدرب الذكي 'أبيكس'؟",
            },
            "answer": {
              "en":
                  "Our AI Trainer uses your data to build a custom workout plan.",
              "ar": "يستخدم المدرب الذكي بياناتك لبناء خطة تمرين مخصصة.",
            },
          },
        ],
      ),
    ],
  );
}
