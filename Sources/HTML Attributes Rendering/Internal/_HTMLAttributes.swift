import HTML_Rendering_Core
import HTML_Standard_Attributes

extension HTML.View {
    package func attribute(
        _ value: String,
        _ condition: @autoclosure () -> Bool?
    ) -> HTML._Attributes<Self> {
        self.attribute(value, condition() == true ? "" : String?.none)
    }

    package func attribute<Attribute: HTML.BooleanAttribute>(
        boolean value: Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(Attribute.attribute, value == true)
    }
}

extension HTML._Attributes {
    package func attribute(
        _ name: String,
        _ value: (some CustomStringConvertible)? = ""
    ) -> HTML._Attributes<Content> {
        self.attribute(name, value?.description)
    }
}
