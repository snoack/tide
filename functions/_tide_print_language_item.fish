function _tide_print_language_item -a item icon text
    if test "$tide_language_items_show_version" = false
        _tide_print_item $item $icon
    else
        _tide_print_item $item $icon' ' $text
    end
end
