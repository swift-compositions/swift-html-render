public import HTML_Rendering_Core
public import Test_Snapshot
public import WHATWG_HTML_Shared

extension Test_Core.Test.Snapshot.Strategy
where Value: HTML.Document.`Protocol`, Format == String {
    public static var html: Self {
        .html()
    }

    public static func html(
        configuration: HTML.Context.Configuration = .pretty
    ) -> Self {
        Test_Core.Test.Snapshot.Strategy<String, String>.lines.pullback { value in
            HTML.Context.Configuration.$current.withValue(configuration) {
                (try? String(value)) ?? "HTML rendering failed"
            }
        }
    }
}

extension Test_Core.Test.Snapshot.Strategy where Value: HTML.View, Format == String {
    public static var html: Self {
        .html()
    }

    public static func html(
        configuration: HTML.Context.Configuration = .pretty
    ) -> Self {
        Test_Core.Test.Snapshot.Strategy<String, String>.lines.pullback { value in
            HTML.Context.Configuration.$current.withValue(configuration) {
                (try? String(value)) ?? "HTML rendering failed"
            }
        }
    }
}
