import HTML_Rendering_Core
import HTML_Standard_Attributes
public import RFC_5646
private import WHATWG_HTML_FormAttributes
private import WHATWG_HTML_ScriptAttributes
import WHATWG_HTML_TableAttributes

extension HTML.View {

    @discardableResult
    package func abbr(
        _ value: HTML.Abbr.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Abbr.Attribute.attribute, value?.description)
    }
}

extension HTML.View {

    @discardableResult
    package func accept(
        _ value: HTML.Accept.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Accept.Attribute.attribute, value?.description)
    }

    @discardableResult
    package func accept(
        _ fileTypes: HTML.Accept.Attribute.FileType?...
    ) -> HTML._Attributes<Self> {
        self.accept(HTML.Accept.Attribute(fileTypes.compactMap { $0 }))
    }

    @discardableResult
    package func accept(
        _ fileTypes: [HTML.Accept.Attribute.FileType?]
    ) -> HTML._Attributes<Self> {
        self.accept(HTML.Accept.Attribute(fileTypes.compactMap { $0 }))
    }
}

extension HTML.View {

    @discardableResult
    package func acceptCharset(
        _ value: HTML.AcceptCharset.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.AcceptCharset.Attribute.attribute, value?.description)
    }
}

extension HTML.View {

    @discardableResult
    public func action(
        _ value: HTML.Action.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Action.Attribute.attribute, value?.description)
    }
}

extension HTML.View {

    @discardableResult
    package func allow(
        _ value: HTML.Allow.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute("allow", value?.description)
    }
}

extension HTML.View {

    @discardableResult
    package func allowfullscreen(
        _ value: HTML.Allowfullscreen.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(boolean: value)
    }
}

extension HTML.View {

    @discardableResult
    package func alt(
        _ value: HTML.Alt.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Alt.Attribute.attribute, value?.description)
    }
}

extension HTML.View {

    @discardableResult
    package func `as`(
        _ value: HTML.As.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.As.Attribute.attribute, value?.rawValue)
    }
}

extension HTML.View {

    @discardableResult
    package func async(
        _ value: WHATWG.HTML.Async.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(boolean: value)
    }
}

extension HTML.View {

    @discardableResult
    package func attributionSrc(
        _ value: HTML.AttributionSrc.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.AttributionSrc.Attribute.attribute, value?.description)
    }
}

extension HTML.View {

    @discardableResult
    package func autocomplete(
        _ value: HTML.Autocomplete.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Autocomplete.Attribute.attribute, value?.description)
    }
}

extension HTML.View {

    @discardableResult
    package func autoplay(
        _ value: HTML.Autoplay.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(boolean: value)
    }
}

extension HTML.View {

    @discardableResult
    package func behavior(
        _ value: HTML.Behavior.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Behavior.Attribute.attribute, value?.description)
    }
}

extension HTML.View {

    @discardableResult
    package func blocking(
        _ value: HTML.Blocking.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Blocking.Attribute.attribute, value?.description)
    }
}

extension HTML.View {

    @discardableResult
    package func type(
        _ value: HTML.Button.`Type`.Attribute?
    ) -> HTML._Attributes<Self> {
        typealias Value = HTML.Button.`Type`.Attribute
        return self.attribute(Value.attribute, value?.rawValue)
    }
}

extension HTML.View {

    @discardableResult
    package func capture(
        _ value: HTML.Capture.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Capture.Attribute.attribute, value?.description)
    }
}

extension HTML.View {

    @discardableResult
    package func charset(
        _ value: HTML.CharSet.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute("charset", value?.description)
    }
}

extension HTML.View {

    package var checked: HTML._Attributes<Self> {
        self.attribute(HTML.Checked.Attribute.attribute)
    }

    @HTML.Builder
    package func checked(_ value: HTML.Checked.Attribute?) -> HTML._Attributes<Self> {
        self.attribute(boolean: value)
    }
}

extension HTML.View {

    @discardableResult
    package func cite(
        _ value: HTML.Cite.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Cite.Attribute.attribute, value?.description)
    }
}

extension HTML.View {

    @discardableResult
    package func colspan(
        _ value: HTML.ColSpan.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.ColSpan.Attribute.attribute, value?.description)
    }
}

extension HTML.View {

    @discardableResult
    package func color(
        _ value: HTML.Color.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Color.Attribute.attribute, value?.description)
    }
}

extension HTML.View {

    @discardableResult
    package func cols(
        _ value: HTML.Cols.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Cols.Attribute.attribute, value?.description)
    }
}

extension HTML.View {

    @discardableResult
    package func compact(
        _ value: HTML.Compact.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Compact.Attribute.attribute, value?.description)
    }
}

extension HTML.View {

    @discardableResult
    package func content(
        _ value: HTML.Content.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Content.Attribute.attribute, value?.description)
    }
}

extension HTML.View {

    @discardableResult
    package func controls(
        _ value: HTML.Controls.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(boolean: value)
    }
}

extension HTML.View {

    @discardableResult
    package func controlsList(
        _ value: HTML.ControlsList.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.ControlsList.Attribute.attribute, value?.description)
    }
}

extension HTML.View {

    @discardableResult
    package func crossorigin(
        _ value: HTML.Crossorigin.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Crossorigin.Attribute.attribute, value?.description)
    }

}

extension HTML.View {

    @discardableResult
    package func dateTime(
        _ value: HTML.DateTime.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.DateTime.Attribute.attribute, value?.description)
    }
}

extension HTML.View {

    @discardableResult
    package func `default`(
        _ value: HTML.Default.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(boolean: value)
    }
}

extension HTML.View {

    @discardableResult
    package func `defer`(
        _ value: HTML.Defer.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(boolean: value)
    }
}

extension HTML.View {

    @discardableResult
    package func direction(
        _ value: WHATWG.HTML.Direction.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(WHATWG.HTML.Direction.Attribute.attribute, value?.description)
    }
}

extension HTML.View {
    @discardableResult
    package func dirname(
        _ value: HTML.Dirname.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Dirname.Attribute.attribute, value?.description)
    }
}

extension HTML.View {

    @discardableResult
    package func disablePictureInPicture(
        _ value: HTML.DisablePictureInPicture.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.DisablePictureInPicture.Attribute.attribute, value?.description)
    }
}

extension HTML.View {

    @discardableResult
    package func disableRemotePlayback(
        _ value: HTML.DisableRemotePlayback.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.DisableRemotePlayback.Attribute.attribute, value?.description)
    }
}

extension HTML.View {

    package var disabled: HTML._Attributes<Self> {
        self.attribute(HTML.Disabled.Attribute.attribute)
    }

    @HTML.Builder
    package func disabled(_ value: HTML.Disabled.Attribute?) -> HTML._Attributes<Self> {
        self.attribute(boolean: value)
    }
}

extension HTML.View {

    @discardableResult
    package func download(
        _ value: HTML.Download.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Download.Attribute.attribute, value?.description)
    }
}

extension HTML.View {

    @discardableResult
    package func elementtiming(
        _ value: HTML.Elementtiming.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Elementtiming.Attribute.attribute, value?.description)
    }

    @discardableResult
    package func elementtiming(
        category: HTML.Elementtiming.Attribute.Category,
        name: String,
        separator: String = "-"
    ) -> HTML._Attributes<Self> {
        self.elementtiming(
            HTML.Elementtiming.Attribute(category: category, name: name, separator: separator)
        )
    }
}

extension HTML.View {

    @discardableResult
    package func EncType(
        _ value: HTML.EncType.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(WHATWG.HTML.EncType.Attribute.attribute, value?.description)
    }
}

extension HTML.View {

    @discardableResult
    package func face(
        _ value: HTML.Face.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Face.Attribute.attribute, value?.description)
    }
}

extension HTML.View {

    @discardableResult
    package func fetchPriority(
        _ value: HTML.FetchPriority.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.FetchPriority.Attribute.attribute, value?.description)
    }
}

extension HTML.View {

    @discardableResult
    package func size(
        _ value: HTML.Font.Size.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Font.Size.Attribute.attribute, value?.description)
    }
}

extension HTML.View {

    @discardableResult
    package func `for`(
        _ value: HTML.For.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.For.Attribute.attribute, value?.description)
    }
}

extension HTML.View {

    @discardableResult
    package func formAction(
        _ value: HTML.FormAction.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.FormAction.Attribute.attribute, value?.description)
    }
}

extension HTML.View {

    @discardableResult
    package func formEncType(
        _ value: HTML.FormEncType.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.FormEncType.Attribute.attribute, value?.description)
    }
}

extension HTML.View {

    @discardableResult
    package func formMethod(
        _ value: HTML.FormMethod.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.FormMethod.Attribute.attribute, value?.description)
    }
}

extension HTML.View {

    @discardableResult
    package func formNovalidate(
        _ value: HTML.FormNovalidate.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(boolean: value)
    }
}

extension HTML.View {

    @discardableResult
    package func formTarget(
        _ value: HTML.FormTarget.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.FormTarget.Attribute.attribute, value?.description)
    }
}

extension HTML.View {

    @discardableResult
    package func frameBorder(
        _ value: HTML.FrameBorder.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.FrameBorder.Attribute.attribute, value?.description)
    }
}

extension HTML.View {
    @discardableResult
    public func autocapitalize(
        _ value: HTML.Autocapitalize.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Autocapitalize.Attribute.attribute, value?.description)
    }
}

extension HTML.View {
    @discardableResult
    public func autocorrect(
        _ value: HTML.Autocorrect.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Autocorrect.Attribute.attribute, value?.description)
    }
}

extension HTML.View {
    public var autofocus: HTML._Attributes<Self> {
        self.attribute(HTML.Autofocus.Attribute.attribute)
    }
}

extension HTML.View {
    @discardableResult
    public func autofocus(
        _ value: HTML.Autofocus.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(boolean: value)
    }
}

extension HTML.View {
    @discardableResult
    public func `class`(
        _ value: HTML.Class.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Class.Attribute.attribute, value?.description)
    }
}

extension HTML.View {
    @discardableResult
    public func contenteditable(
        _ value: HTML.Contenteditable.Attribute
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Contenteditable.Attribute.attribute, value.description)
    }

    public var contenteditable: HTML._Attributes<Self> {
        self.contenteditable(.true)
    }
}

extension HTML.View {
    @discardableResult
    public func data(
        _ name: some CustomStringConvertible,
        _ value: some CustomStringConvertible
    ) -> HTML._Attributes<Self> {
        let attribute = HTML.Data.Attribute(name: name, value: value)
        return self.attribute(attribute.attributeName, attribute.description)
    }

    @discardableResult
    public func data(
        _ value: HTML.Data.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(value?.attributeName ?? "", value?.description)
    }
}

extension HTML.View {

    @discardableResult
    public func dir(
        _ value: HTML.Dir.Attribute
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Dir.Attribute.attribute, value.description)
    }
}

extension HTML.View {

    @discardableResult
    public func draggable(
        _ value: HTML.Draggable.Attribute
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Draggable.Attribute.attribute, value.description)
    }

    public var draggable: HTML._Attributes<Self> {
        self.draggable(.true)
    }
}

extension HTML.View {

    @discardableResult
    public func enterkeyhint(
        _ value: HTML.Enterkeyhint.Attribute
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Enterkeyhint.Attribute.attribute, value.description)
    }
}

extension HTML.View {

    @discardableResult
    public func exportparts(
        _ parts: [String]
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Exportparts.Attribute.attribute, parts.joined(separator: ", "))
    }

    @discardableResult
    public func exportparts(
        _ parts: String...
    ) -> HTML._Attributes<Self> {
        self.exportparts(parts)
    }

    @discardableResult
    public func exportparts(
        _ mappings: [HTML.Exportparts.Attribute.PartMapping]
    ) -> HTML._Attributes<Self> {
        let value = mappings.map { mapping in
            guard mapping.originalName == mapping.exposedName else {
                return "\(mapping.originalName):\(mapping.exposedName)"
            }
            return mapping.originalName
        }.joined(separator: ", ")

        return self.attribute(HTML.Exportparts.Attribute.attribute, value)
    }

    @discardableResult
    public func exportparts(
        _ attribute: HTML.Exportparts.Attribute
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Exportparts.Attribute.attribute, attribute.description)
    }
}

extension HTML.View {

    @discardableResult
    public func hidden(
        _ hidden: HTML.Hidden.Attribute
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Hidden.Attribute.attribute)
    }

    @discardableResult
    public func hidden() -> HTML._Attributes<Self> {
        self.attribute(HTML.Hidden.Attribute.attribute)
    }
}

extension HTML.View {

    @discardableResult
    public func id(
        _ id: String
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Id.Attribute.attribute, id)
    }

    @discardableResult
    public func id(
        _ id: HTML.Id.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Id.Attribute.attribute, id?.description)
    }
}

extension HTML.View {

    public var inert: HTML._Attributes<Self> {
        self.attribute(HTML.Inert.Attribute.attribute)
    }

    @HTML.Builder
    package func inert(_ value: HTML.Inert.Attribute?) -> HTML._Attributes<Self> {
        self.attribute(boolean: value)
    }
}

extension HTML.View {

    @discardableResult
    public func inputmode(
        _ mode: HTML.Inputmode.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Inputmode.Attribute.attribute, mode?.description)
    }
}

extension HTML.View {

    @discardableResult
    public func `is`(
        _ value: String
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Is.Attribute.attribute, HTML.Is.Attribute(value).description)
    }

    @discardableResult
    public func `is`(
        _ value: HTML.Is.Attribute
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Is.Attribute.attribute, value.description)
    }
}

extension HTML.View {

    @discardableResult
    public func itemid(
        _ identifier: String
    ) -> HTML._Attributes<Self> {
        self.attribute(
            HTML.Itemid.Attribute.attribute,
            HTML.Itemid.Attribute(identifier).description
        )
    }

    @discardableResult
    public func itemid(
        _ value: HTML.Itemid.Attribute
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Itemid.Attribute.attribute, value.description)
    }
}

extension HTML.View {

    @discardableResult
    public func itemprop(
        _ propertyName: String
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Itemprop.Attribute.attribute, propertyName)
    }

    @discardableResult
    public func itemprop(
        _ propertyNames: [String]
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Itemprop.Attribute.attribute, propertyNames.joined(separator: " "))
    }

    @discardableResult
    public func itemprop(
        _ propertyNames: String...
    ) -> HTML._Attributes<Self> {
        self.itemprop(propertyNames)
    }

    @discardableResult
    public func itemprop(
        _ attribute: HTML.Itemprop.Attribute
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Itemprop.Attribute.attribute, attribute.description)
    }
}

extension HTML.View {

    @discardableResult
    public func itemref(
        _ id: String
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Itemref.Attribute.attribute, id)
    }

    @discardableResult
    public func itemref(
        _ ids: [String]
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Itemref.Attribute.attribute, ids.joined(separator: " "))
    }

    @discardableResult
    public func itemref(
        _ ids: String...
    ) -> HTML._Attributes<Self> {
        self.itemref(ids)
    }

    @discardableResult
    public func itemref(
        _ attribute: HTML.Itemref.Attribute
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Itemref.Attribute.attribute, attribute.description)
    }
}

extension HTML.View {

    public var itemscope: HTML._Attributes<Self> {
        self.attribute(HTML.Itemscope.Attribute.attribute)
    }

    @discardableResult
    public func itemscope(
        _ value: HTML.Itemscope.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(boolean: value)
    }
}

extension HTML.View {

    @discardableResult
    public func itemtype(
        _ value: String
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Itemtype.Attribute.attribute, value)
    }

    @discardableResult
    public func itemtype(
        _ values: [String]
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Itemtype.Attribute.attribute, values.joined(separator: " "))
    }

    @discardableResult
    public func itemtype(
        _ values: String...
    ) -> HTML._Attributes<Self> {
        self.itemtype(values)
    }

    @discardableResult
    public func itemtype(
        _ attribute: HTML.Itemtype.Attribute
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Itemtype.Attribute.attribute, attribute.description)
    }

    @discardableResult
    public func itemtype(
        schemaOrg type: String
    ) -> HTML._Attributes<Self> {
        self.itemtype(HTML.Itemtype.Attribute(schemaOrg: type))
    }
}

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

extension HTML.View {

    @discardableResult
    public func nonce(
        _ attribute: HTML.Nonce.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Nonce.Attribute.attribute, attribute?.description)
    }
}

extension HTML.View {

    @discardableResult
    public func part(
        _ partName: String
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Part.Attribute.attribute, partName)
    }

    @discardableResult
    public func part(
        _ partNames: [String]
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Part.Attribute.attribute, partNames.joined(separator: " "))
    }

    @discardableResult
    public func part(
        _ partNames: String...
    ) -> HTML._Attributes<Self> {
        self.part(partNames)
    }

    @discardableResult
    public func part(
        _ attribute: HTML.Part.Attribute
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Part.Attribute.attribute, attribute.description)
    }
}

extension HTML.View {

    @discardableResult
    public func popover() -> HTML._Attributes<Self> {
        self.attribute(HTML.Popover.Attribute.attribute, "")
    }

    @discardableResult
    public func popover(
        _ type: HTML.Popover.Attribute
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Popover.Attribute.attribute, type.description)
    }

    @discardableResult
    public func popover(
        _ value: String
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Popover.Attribute.attribute, value)
    }
}

extension HTML.View {

    @discardableResult
    public func popovertarget(
        _ id: String
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.PopoverTarget.Attribute.attribute, id)
    }

    @discardableResult
    public func popovertarget(
        _ attribute: HTML.PopoverTarget.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.PopoverTarget.Attribute.attribute, attribute?.description)
    }
}

extension HTML.View {

    @discardableResult
    public func popovertargetaction(
        _ action: HTML.PopoverTargetAction.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.PopoverTargetAction.Attribute.attribute, action?.description)
    }
}

extension HTML.View {

    @discardableResult
    public func slot(
        _ name: String
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Slot.Attribute.attribute, name)
    }

    @discardableResult
    public func slot(
        _ attribute: HTML.Slot.Attribute
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Slot.Attribute.attribute, attribute.description)
    }
}

extension HTML.View {

    @discardableResult
    package func spellcheck(
        _ attribute: HTML.Spellcheck.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Spellcheck.Attribute.attribute, attribute?.description)
    }
}

extension HTML.View {

    @discardableResult
    public func style(
        _ css: String
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Style.Attribute.attribute, css)
    }

    @discardableResult
    public func style(
        _ declarations: [String: String]
    ) -> HTML._Attributes<Self> {
        let formattedDeclarations = declarations.map { key, value in
            "\(key): \(value)"
        }.joined(separator: "; ")

        return self.attribute(HTML.Style.Attribute.attribute, formattedDeclarations)
    }

    @discardableResult
    public func style(
        _ attribute: WHATWG.HTML.Style.Attribute
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Style.Attribute.attribute, attribute.description)
    }
}

extension HTML.View {

    @discardableResult
    public func tabindex(
        _ value: Int
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Tabindex.Attribute.attribute, String(value))
    }

    @discardableResult
    public func tabindex(
        _ attribute: HTML.Tabindex.Attribute
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Tabindex.Attribute.attribute, attribute.description)
    }

    @discardableResult
    public func notTabbable() -> HTML._Attributes<Self> {
        self.tabindex(HTML.Tabindex.Attribute.notTabbable)
    }

    @discardableResult
    public func tabbableInDocumentOrder() -> HTML._Attributes<Self> {
        self.tabindex(HTML.Tabindex.Attribute.inDocumentOrder)
    }
}

extension HTML.View {

    @discardableResult
    public func title(
        _ value: String
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Title.Attribute.attribute, value)
    }

    @discardableResult
    public func title(
        lines: [String]
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Title.Attribute.attribute, lines.joined(separator: "\n"))
    }

    @discardableResult
    public func title(
        lines: String...
    ) -> HTML._Attributes<Self> {
        self.title(lines: lines)
    }

    @discardableResult
    public func title(
        _ attribute: HTML.Title.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Title.Attribute.attribute, attribute?.description)
    }

    @discardableResult
    public func noTitle() -> HTML._Attributes<Self> {
        self.title(HTML.Title.Attribute.empty)
    }
}

extension HTML.View {

    @discardableResult
    public func translate(
        _ attribute: HTML.Translate.Attribute
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Translate.Attribute.attribute, attribute.description)
    }
}

extension HTML.View {

    @discardableResult
    public func virtualkeyboardpolicy(
        _ policy: HTML.Virtualkeyboardpolicy.Attribute
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Virtualkeyboardpolicy.Attribute.attribute, policy.description)
    }

    @discardableResult
    public func autoKeyboard() -> HTML._Attributes<Self> {
        self.virtualkeyboardpolicy(.auto)
    }

    @discardableResult
    public func manualKeyboard() -> HTML._Attributes<Self> {
        self.virtualkeyboardpolicy(.manual)
    }
}

extension HTML.View {

    @discardableResult
    public func writingsuggestions(
        _ enabled: Bool
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Writingsuggestions.Attribute.attribute, enabled ? "true" : "false")
    }

    @discardableResult
    public func writingsuggestions(
        _ attribute: HTML.Writingsuggestions.Attribute
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Writingsuggestions.Attribute.attribute, attribute.description)
    }

    @discardableResult
    public func enableWritingSuggestions() -> HTML._Attributes<Self> {
        self.writingsuggestions(HTML.Writingsuggestions.Attribute.true)
    }

    @discardableResult
    public func disableWritingSuggestions() -> HTML._Attributes<Self> {
        self.writingsuggestions(HTML.Writingsuggestions.Attribute.false)
    }
}

extension HTML.View {

    @discardableResult
    package func httpEquiv(
        _ value: HTML.HttpEquiv.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute("http-equiv", value?.description)
    }
}

extension HTML.View {

    @discardableResult
    package func headers(
        _ value: HTML.Headers.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Headers.Attribute.attribute, value?.description)
    }
}

extension HTML.View {

    @discardableResult
    package func height(
        _ value: HTML.Height.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Height.Attribute.attribute, value?.description)
    }
}

extension HTML.View {

    @discardableResult
    package func high(
        _ value: HTML.High.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.High.Attribute.attribute, value?.description)
    }
}

extension HTML.View {

    @discardableResult
    public func href(
        _ value: HTML.Href.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Href.Attribute.attribute, value?.description)
    }
}

extension HTML.View {

    @discardableResult
    package func hreflang(
        _ value: HTML.Hreflang.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Hreflang.Attribute.attribute, value?.description)
    }
}

extension HTML.View {

    @discardableResult
    package func srcset(
        _ value: HTML.ImageSrcSet.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.ImageSrcSet.Attribute.attribute, value?.description)
    }
}

extension HTML.View {

    @discardableResult
    package func sizes(
        _ value: HTML.ImageSizes.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.ImageSizes.Attribute.attribute, value?.description)
    }
}

extension HTML.View {

    @discardableResult
    package func integrity(
        _ value: HTML.Integrity.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Integrity.Attribute.attribute, value?.description)
    }
}

extension HTML.View {

    @discardableResult
    package func isMap(
        _ value: HTML.Ismap.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(boolean: value)
    }
}

extension HTML.View {

    @discardableResult
    package func kind(
        _ value: HTML.Kind.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Kind.Attribute.attribute, value?.description)
    }
}

extension HTML.View {

    @discardableResult
    @_disfavoredOverload
    package func label(
        _ value: HTML.Label.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Label.Attribute.attribute, value?.description)
    }
}

extension HTML.View {

    @discardableResult
    package func type(
        _ value: HTML.Link.`Type`.Attribute?
    ) -> HTML._Attributes<Self> {
        typealias Value = HTML.Link.`Type`.Attribute
        return self.attribute(Value.attribute, value?.description)
    }
}

extension HTML.View {

    @discardableResult
    package func list(
        _ value: WHATWG.HTML.List.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(WHATWG.HTML.List.Attribute.attribute, value?.description)
    }
}

extension HTML.View {

    @discardableResult
    package func type(
        _ value: HTML.OrderedList.`Type`.Attribute?
    ) -> HTML._Attributes<Self> {
        typealias Value = HTML.OrderedList.`Type`.Attribute
        return self.attribute(Value.attribute, value?.description)
    }
}

extension HTML.View {

    @discardableResult
    package func loading(
        _ value: HTML.Loading.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Loading.Attribute.attribute, value?.rawValue)
    }
}

extension HTML.View {

    @discardableResult
    package func loop(
        _ value: HTML.Loop.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(boolean: value)
    }
}

extension HTML.View {

    @discardableResult
    package func low(
        _ value: HTML.Low.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Low.Attribute.attribute, value?.description)
    }
}

extension HTML.View {

    @discardableResult
    package func marginHeight(
        _ value: HTML.MarginHeight.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.MarginHeight.Attribute.attribute, value?.description)
    }
}

extension HTML.View {

    @discardableResult
    package func marginWidth(
        _ value: HTML.MarginWidth.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.MarginWidth.Attribute.attribute, value?.description)
    }
}

extension HTML.View {

    @discardableResult
    package func max(
        _ value: HTML.Max.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Max.Attribute.attribute, value?.description)
    }

}

extension HTML.View {

    @discardableResult
    package func maxlength(
        _ value: HTML.Maxlength.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Maxlength.Attribute.attribute, value?.description)
    }
}

extension HTML.View {

    @discardableResult
    package func media(
        _ value: HTML.Media.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Media.Attribute.attribute, value?.description)
    }
}

extension HTML.View {

    @discardableResult
    package func method(
        _ value: HTML.Method.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Method.Attribute.attribute, value?.description)
    }
}

extension HTML.View {

    @discardableResult
    package func min(
        _ value: HTML.Min.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Min.Attribute.attribute, value?.description)
    }
}

extension HTML.View {

    @discardableResult
    package func minlength(
        _ value: HTML.Minlength.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Minlength.Attribute.attribute, value?.description)
    }
}

extension HTML.View {

    package var multiple: HTML._Attributes<Self> {
        self.attribute(HTML.Multiple.Attribute.attribute)
    }

    @HTML.Builder
    package func multiple(_ value: HTML.Multiple.Attribute?) -> HTML._Attributes<Self> {
        self.attribute(boolean: value)
    }
}

extension HTML.View {

    @discardableResult
    package func muted(
        _ value: HTML.Muted.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(boolean: value)
    }
}

extension HTML.View {

    @discardableResult
    package func name(
        _ value: HTML.Name.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Name.Attribute.attribute, value?.description)
    }
}

extension HTML.View {

    @discardableResult
    package func name(
        _ value: HTML.Meta.Name.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Meta.Name.Attribute.attribute, value?.description)
    }
}

extension HTML.View {

    @discardableResult
    package func noResize(
        _ value: HTML.NoResize.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.NoResize.Attribute.attribute, value?.description)
    }
}

extension HTML.View {

    @discardableResult
    package func nomodule(
        _ value: HTML.Nomodule.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(boolean: value)
    }
}

extension HTML.View {

    package var novalidate: HTML._Attributes<Self> {
        self.attribute(HTML.Novalidate.Attribute.attribute)
    }

    @HTML.Builder
    package func novalidate(
        _ value: HTML.Novalidate.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(boolean: value)
    }
}

extension HTML.View {

    @discardableResult
    package func data(
        _ value: HTML.ExternalObject.Data.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.ExternalObject.Data.Attribute.attribute, value?.description)
    }
}

extension HTML.View {

    @discardableResult
    package func form(
        _ value: HTML.Form.Attribute.ID?
    ) -> HTML._Attributes<Self> {
        self.attribute("form", value?.description)
    }
}

extension HTML.View {

    @discardableResult
    package func type(
        _ value: HTML.ExternalObject.`Type`.Attribute?
    ) -> HTML._Attributes<Self> {
        typealias Value = HTML.ExternalObject.`Type`.Attribute
        return self.attribute(Value.attribute, value?.description)
    }
}

extension HTML.View {

    @discardableResult
    package func open(
        _ value: HTML.Open.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(boolean: value)
    }
}

extension HTML.View {

    @discardableResult
    package func optimum(
        _ value: HTML.Optimum.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Optimum.Attribute.attribute, value?.description)
    }
}

extension HTML.View {

    @discardableResult
    package func pattern(
        _ value: HTML.Pattern.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Pattern.Attribute.attribute, value?.description)
    }
}

extension HTML.View {

    @discardableResult
    package func ping(
        _ value: HTML.Ping.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Ping.Attribute.attribute, value?.description)
    }
}

extension HTML.View {

    @discardableResult
    package func placeholder(
        _ value: HTML.Placeholder.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Placeholder.Attribute.attribute, value?.description)
    }
}

extension HTML.View {

    @discardableResult
    package func playsinline(
        _ value: HTML.Playsinline.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Playsinline.Attribute.attribute, value?.description)
    }
}

extension HTML.View {

    @discardableResult
    func popoverTarget(
        _ value: HTML.PopoverTarget.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.PopoverTarget.Attribute.attribute, value?.description)
    }
}

extension HTML.View {

    @discardableResult
    func popoverTargetAction(
        _ value: HTML.PopoverTargetAction.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.PopoverTargetAction.Attribute.attribute, value?.description)
    }
}

extension HTML.View {

    @discardableResult
    package func poster(
        _ value: HTML.Poster.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Poster.Attribute.attribute, value?.description)
    }
}

extension HTML.View {

    @discardableResult
    package func preload(
        _ value: HTML.Preload.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Preload.Attribute.attribute, value?.description)
    }
}

extension HTML.View {

    package var readonly: HTML._Attributes<Self> {
        self.attribute(HTML.Readonly.Attribute.attribute)
    }

    @HTML.Builder
    package func readonly(
        _ value: HTML.Readonly.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(boolean: value)
    }
}

extension HTML.View {

    @discardableResult
    package func referrerPolicy(
        _ value: HTML.ReferrerPolicy.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.ReferrerPolicy.Attribute.attribute, value?.description)
    }
}

extension HTML.View {

    @discardableResult
    package func rel(
        _ value: HTML.Rel.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Rel.Attribute.attribute, value?.description)
    }
}

extension HTML.View {

    package var required: HTML._Attributes<Self> {
        self.attribute(HTML.Required.Attribute.attribute)
    }

    @HTML.Builder
    package func required(
        _ value: HTML.Required.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(boolean: value)
    }
}

extension HTML.View {

    @discardableResult
    package func reversed(
        _ value: HTML.Reversed.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(boolean: value)
    }
}

extension HTML.View {

    @discardableResult
    package func rowspan(
        _ value: HTML.RowSpan.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.RowSpan.Attribute.attribute, value?.description)
    }
}

extension HTML.View {

    @discardableResult
    package func rows(
        _ value: HTML.Rows.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Rows.Attribute.attribute, value?.description)
    }
}

extension HTML.View {

    @discardableResult
    package func scope(
        _ value: HTML.Scope.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Scope.Attribute.attribute, value?.description)
    }
}

extension HTML.View {

    @discardableResult
    package func type(
        _ value: HTML.Script.`Type`.Attribute?
    ) -> HTML._Attributes<Self> {
        typealias Value = HTML.Script.`Type`.Attribute
        return self.attribute(Value.attribute, value?.description)
    }
}

extension HTML.View {

    @discardableResult
    package func scrolling(
        _ value: HTML.Scrolling.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Scrolling.Attribute.attribute, value?.rawValue)
    }
}

extension HTML.View {

    @discardableResult
    package func selected(
        _ value: HTML.Selected.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(boolean: value)
    }
}

extension HTML.View {

    @discardableResult
    package func shadowRootClonable(
        _ value: HTML.ShadowRootClonable.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.ShadowRootClonable.Attribute.attribute, value?.description)
    }
}

extension HTML.View {

    @discardableResult
    package func shadowRootDelegatesFocus(
        _ value: HTML.ShadowRootDelegatesFocus.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.ShadowRootDelegatesFocus.Attribute.attribute, value?.description)
    }
}

extension HTML.View {

    @discardableResult
    package func shadowRootMode(
        _ value: HTML.ShadowRootMode.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.ShadowRootMode.Attribute.attribute, value?.description)
    }
}

extension HTML.View {

    @discardableResult
    package func size(
        _ value: HTML.Size.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Size.Attribute.attribute, value?.description)
    }
}

extension HTML.View {

    @discardableResult
    package func sizes(
        _ value: HTML.Sizes.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Sizes.Attribute.attribute, value?.description)
    }
}

extension HTML.View {

    @discardableResult
    package func type(
        _ value: HTML.Source.`Type`.Attribute?
    ) -> HTML._Attributes<Self> {
        typealias Value = HTML.Source.`Type`.Attribute
        return self.attribute(Value.attribute, value?.description)
    }
}

extension HTML.View {

    @discardableResult
    package func span(
        _ value: WHATWG.HTML.Span.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(WHATWG.HTML.Span.Attribute.attribute, value?.description)
    }
}

extension HTML.View {

    @discardableResult
    package func src(
        _ value: HTML.Src.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Src.Attribute.attribute, value?.description)
    }
}

extension HTML.View {

    @discardableResult
    package func srcLang(
        _ value: HTML.SrcLang.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.SrcLang.Attribute.attribute, value?.description)
    }
}

extension HTML.View {

    @discardableResult
    package func start(
        _ value: HTML.Start.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Start.Attribute.attribute, value?.description)
    }
}

extension HTML.View {

    @discardableResult
    package func step(
        _ value: HTML.Step.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Step.Attribute.attribute, value?.description)
    }
}

extension HTML.View {

    @discardableResult
    package func target(
        _ value: HTML.Target.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Target.Attribute.attribute, value?.description)
    }
}

extension HTML.View {

    @discardableResult
    package func target(
        _ value: HTML.FormTarget.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.FormTarget.Attribute.attribute, value?.description)
    }
}

extension HTML.View {

    @discardableResult
    package func target(
        form value: HTML.Target.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Target.Attribute.attribute, value?.description)
    }
}

extension HTML.View {

    @discardableResult
    public func target(
        anchor value: HTML.Target.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Target.Attribute.attribute, value?.description)
    }

    @discardableResult
    @HTML.Builder
    public func openInNewTab(
        withOpener: Bool = false
    ) -> some HTML.View {
        let result = self.target(anchor: .blank)

        if withOpener {
            result
        } else {
            result.rel(.noopener)
        }
    }

    @discardableResult
    public func openInParent() -> HTML._Attributes<Self> {
        self.target(anchor: .parent)
    }

    @discardableResult
    public func openInTop() -> HTML._Attributes<Self> {
        self.target(anchor: .top)
    }
}

extension HTML.View {

    package var truespeed: HTML._Attributes<Self> {
        self.attribute(HTML.Truespeed.Attribute.attribute)
    }

    @HTML.Builder
    package func truespeed(
        _ value: HTML.Truespeed.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(boolean: value)
    }
}

extension HTML.View {

    @discardableResult
    package func usemap(
        _ value: HTML.Usemap.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Usemap.Attribute.attribute, value?.description)
    }
}

extension HTML.View {

    @discardableResult
    package func value<Element: CustomStringConvertible>(
        _ value: HTML.Value.Attribute<Element>?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Value.Attribute<Element>.attribute, value?.description)
    }
}

extension HTML.View {

    @discardableResult
    package func width(
        _ value: HTML.Width.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Width.Attribute.attribute, value?.description)
    }
}

extension HTML.View {

    @discardableResult
    package func wrap(
        _ value: HTML.Wrap.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Wrap.Attribute.attribute, value?.description)
    }
}

extension HTML.View {

    @discardableResult
    package func xmlns(
        _ value: HTML.Xmlns.Attribute?
    ) -> HTML._Attributes<Self> {
        self.attribute(HTML.Xmlns.Attribute.attribute, value?.description)
    }
}
