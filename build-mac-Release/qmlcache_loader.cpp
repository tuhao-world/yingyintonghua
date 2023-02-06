#include <QtQml/qqmlprivate.h>
#include <QtCore/qdir.h>
#include <QtCore/qurl.h>

static const unsigned char qt_resource_tree[] = {
0,
0,0,0,0,2,0,0,0,4,0,0,0,1,0,0,0,
8,0,2,0,0,0,1,0,0,0,10,0,0,0,214,0,
2,0,0,0,2,0,0,0,8,0,0,0,48,0,2,0,
0,0,3,0,0,0,5,0,0,0,192,0,0,0,0,0,
1,0,0,0,0,0,0,0,154,0,0,0,0,0,1,0,
0,0,0,0,0,0,116,0,0,0,0,0,1,0,0,0,
0,0,0,0,66,0,0,0,0,0,1,0,0,0,0,0,
0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,
228,0,0,0,0,0,1,0,0,0,0,0,0,0,20,0,
0,0,0,0,1,0,0,0,0};
static const unsigned char qt_resource_names[] = {
0,
1,0,0,0,47,0,47,0,3,0,0,125,178,0,119,0,
101,0,98,0,11,15,117,59,188,0,87,0,101,0,98,0,
86,0,105,0,101,0,119,0,46,0,113,0,109,0,108,0,
6,6,166,68,94,0,99,0,111,0,109,0,109,0,111,0,
110,0,22,11,99,51,28,0,82,0,101,0,115,0,105,0,
122,0,97,0,98,0,108,0,101,0,82,0,101,0,99,0,
116,0,97,0,110,0,103,0,108,0,101,0,46,0,113,0,
109,0,108,0,16,8,224,120,156,0,87,0,105,0,100,0,
103,0,101,0,116,0,68,0,105,0,97,0,108,0,111,0,
103,0,46,0,113,0,109,0,108,0,16,5,154,184,28,0,
87,0,105,0,110,0,100,0,111,0,119,0,68,0,105,0,
97,0,108,0,111,0,103,0,46,0,113,0,109,0,108,0,
8,8,1,90,92,0,109,0,97,0,105,0,110,0,46,0,
113,0,109,0,108,0,4,0,7,201,194,0,117,0,115,0,
101,0,114,0,13,9,118,82,252,0,76,0,111,0,103,0,
105,0,110,0,86,0,105,0,101,0,119,0,46,0,113,0,
109,0,108,0,18,7,5,199,252,0,65,0,99,0,99,0,
111,0,117,0,110,0,116,0,77,0,97,0,110,0,97,0,
103,0,101,0,114,0,46,0,113,0,109,0,108};
static const unsigned char qt_resource_empty_payout[] = { 0, 0, 0, 0, 0 };
QT_BEGIN_NAMESPACE
extern Q_CORE_EXPORT bool qRegisterResourceData(int, const unsigned char *, const unsigned char *, const unsigned char *);
QT_END_NAMESPACE
namespace QmlCacheGeneratedCode {
namespace _user_AccountManager_qml { 
    extern const unsigned char qmlData[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), nullptr, nullptr
    };
}
namespace _0x5f__main_qml { 
    extern const unsigned char qmlData[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), nullptr, nullptr
    };
}
namespace _common_WindowDialog_qml { 
    extern const unsigned char qmlData[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), nullptr, nullptr
    };
}
namespace _web_WebView_qml { 
    extern const unsigned char qmlData[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), nullptr, nullptr
    };
}
namespace _common_WidgetDialog_qml { 
    extern const unsigned char qmlData[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), nullptr, nullptr
    };
}
namespace _common_ResizableRectangle_qml { 
    extern const unsigned char qmlData[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), nullptr, nullptr
    };
}
namespace _user_LoginView_qml { 
    extern const unsigned char qmlData[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), nullptr, nullptr
    };
}

}
namespace {
struct Registry {
    Registry();
    ~Registry();
    QHash<QString, const QQmlPrivate::CachedQmlUnit*> resourcePathToCachedUnit;
    static const QQmlPrivate::CachedQmlUnit *lookupCachedUnit(const QUrl &url);
};

Q_GLOBAL_STATIC(Registry, unitRegistry)


Registry::Registry() {
        resourcePathToCachedUnit.insert(QStringLiteral("/user/AccountManager.qml"), &QmlCacheGeneratedCode::_user_AccountManager_qml::unit);
        resourcePathToCachedUnit.insert(QStringLiteral("/main.qml"), &QmlCacheGeneratedCode::_0x5f__main_qml::unit);
        resourcePathToCachedUnit.insert(QStringLiteral("/common/WindowDialog.qml"), &QmlCacheGeneratedCode::_common_WindowDialog_qml::unit);
        resourcePathToCachedUnit.insert(QStringLiteral("/web/WebView.qml"), &QmlCacheGeneratedCode::_web_WebView_qml::unit);
        resourcePathToCachedUnit.insert(QStringLiteral("/common/WidgetDialog.qml"), &QmlCacheGeneratedCode::_common_WidgetDialog_qml::unit);
        resourcePathToCachedUnit.insert(QStringLiteral("/common/ResizableRectangle.qml"), &QmlCacheGeneratedCode::_common_ResizableRectangle_qml::unit);
        resourcePathToCachedUnit.insert(QStringLiteral("/user/LoginView.qml"), &QmlCacheGeneratedCode::_user_LoginView_qml::unit);
    QQmlPrivate::RegisterQmlUnitCacheHook registration;
    registration.version = 0;
    registration.lookupCachedQmlUnit = &lookupCachedUnit;
    QQmlPrivate::qmlregister(QQmlPrivate::QmlUnitCacheHookRegistration, &registration);
QT_PREPEND_NAMESPACE(qRegisterResourceData)(/*version*/0x01, qt_resource_tree, qt_resource_names, qt_resource_empty_payout);
}

Registry::~Registry() {
    QQmlPrivate::qmlunregister(QQmlPrivate::QmlUnitCacheHookRegistration, quintptr(&lookupCachedUnit));
}

const QQmlPrivate::CachedQmlUnit *Registry::lookupCachedUnit(const QUrl &url) {
    if (url.scheme() != QLatin1String("qrc"))
        return nullptr;
    QString resourcePath = QDir::cleanPath(url.path());
    if (resourcePath.isEmpty())
        return nullptr;
    if (!resourcePath.startsWith(QLatin1Char('/')))
        resourcePath.prepend(QLatin1Char('/'));
    return unitRegistry()->resourcePathToCachedUnit.value(resourcePath, nullptr);
}
}
int QT_MANGLE_NAMESPACE(qInitResources_qml)() {
    ::unitRegistry();
    return 1;
}
Q_CONSTRUCTOR_FUNCTION(QT_MANGLE_NAMESPACE(qInitResources_qml))
int QT_MANGLE_NAMESPACE(qCleanupResources_qml)() {
    return 1;
}
