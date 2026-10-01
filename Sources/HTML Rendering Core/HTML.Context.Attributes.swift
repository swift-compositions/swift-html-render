public import Buffer_Linear_Primitive
public import Memory
public import Memory_Allocator
public import Storage
public import Buffer

public import Dictionary_Ordered
public import Dictionary
public import Hash_Indexed_Primitive
public import Hash_Table_Primitive
public import Ownership_Shared_Primitive
public import WHATWG_HTML_Shared

extension HTML.Context {

    public typealias Attributes = __DictionaryOrdered<
        Ownership.Shared<
            Hash.Entry<String, String>,
            Hash.Indexed<Buffer<Storage<Memory.Allocator<Memory.Heap>>.Contiguous<Hash.Entry<String, String>>>.Linear>
        >
    >

    public typealias Styles = __DictionaryOrdered<
        Ownership.Shared<
            Hash.Entry<HTML.Style.Rule, String>,
            Hash.Indexed<Buffer<Storage<Memory.Allocator<Memory.Heap>>.Contiguous<Hash.Entry<HTML.Style.Rule, String>>>.Linear>
        >
    >
}
