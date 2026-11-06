import HTML_Rendering_Core
import HTML_Standard_Attributes
public import RFC_5646

extension HTML.View {

    @discardableResult
    public func lang(
        _ language: RFC_5646.LanguageTag
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Lang.Attribute.attribute, language.value)
    }

    @discardableResult
    public func lang(
        _ attribute: HTML.Lang.Attribute
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Lang.Attribute.attribute, attribute.description)
    }
}
