import HTML_Rendering_Core
import HTML_Standard_Attributes

extension HTML.View {

    @discardableResult
    func popoverTargetAction(
        _ value: HTML.PopoverTargetAction.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.PopoverTargetAction.Attribute.attribute, value?.description)
    }
}
