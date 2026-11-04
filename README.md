# swift-html-render

Use this package when you build HTML in Swift as typed views and need the bytes or string to send. Conform your components to `HTML.View`, wrap a page in `HTML.Document`, and render it with `String.init(_:configuration:)` or into a `[Byte]`. If you also want typed CSS, SVG and the rest in one import, use swift-html. For typed CSS properties on these views, use swift-css-html-render. For Markdown content, use swift-markdown-html-render.

## Laws

- Text escapes `&`, `<` and `>`. Attribute values also escape `"` and `'`. `HTML.Raw` is written byte for byte, without escaping.
- An attribute whose value is the empty string is written as a bare name, such as `hidden`. A nil value leaves the attribute out. Classes added to the same element are joined with spaces.
- Every distinct style rule, meaning its declaration together with its at-rule, selector and pseudo-class, becomes one generated class, and every element with that rule shares it. The class name is the CSS property name followed by a counter.
- Generated styles are only written out by `HTML.Document`, as one `<style>` element in the head. Rendering a view on its own gives the markup with its class names but no stylesheet.
- In the stylesheet, rules without an at-rule come first. The at-rule groups follow in the order their first rule was registered. The same views always render to the same bytes.
- Rendering without a configuration uses `HTML.Context.Configuration.current`, a task-local value that defaults to `HTML.Context.Configuration.default`. The default output has no newlines or indentation. `HTML.Context.Configuration.pretty` indents by two spaces and never indents inside `pre`. `HTML.Context.Configuration.email` adds `!important` to every generated rule.
- Text inside an inline `HTML.Script.Element` is not HTML escaped. Only a `<` that starts `<!--`, `<script` or `</script` is written as `\x3C`, so the script can't end its element early.
- `HTML.View.openInNewTab(withOpener:)` also sets `rel="noopener"` unless you pass true.
- Streaming through `Async.Channel<ArraySlice<Byte>>.Bounded` renders the whole view first and then sends it in chunks of at most 4096 bytes by default. The channel holds one chunk at a time, so a slow reader holds back the sender.
