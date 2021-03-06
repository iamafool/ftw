
(defpackage #:ftw
  (:use #:cl #:cffi)
  (:export ;; constants.lisp
           #:const
	   #:logior-consts

	   ;; ffi.lisp 
	   #:switch
	   #:with-wide-string
	   #:memset
	   #:point
	   #:wparam
	   #:lparam
	   #:msg
	   #:make-msg
	   #:msg-hwnd
	   #:msg-message
	   #:msg-wparam
	   #:msg-lparam
	   #:msg-time
	   #:msg-pt 
	   #:msg-foreign
	   #:foreign-msg
	   #:get-message
	   #:translate-message
	   #:dispatch-message
	   #:post-quit-message
	   #:post-message
	   #:send-message
	   #:send-message-timeout
	   #:register-window-message
	   #:get-active-window
	   #:defwndproc
	   #:get-module-handle
	   #:unregister-class 
	   #:register-class
	   #:create-window
	   #:message-box
	   #:default-window-proc
	   #:show-window
	   #:update-window
	   #:destroy-window
	   #:get-stock-object
	   #:get-sys-color-brush
	   #:get-sys-color
	   #:load-icon
	   #:load-cursor
	   #:load-image
	   #:in-send-message-p
	   #:enum-child-windows
	   #:find-window
	   #:get-parent
	   #:make-rect
	   #:rect-left
	   #:rect-right
	   #:rect-top
	   #:rect-bottom
	   #:rect-foreign
	   #:foreign-rect
	   #:info
	   #:info-size
	   #:info-window
	   #:info-client
	   #:info-style
	   #:info-ex-style
	   #:info-status
	   #:info-borders
	   #:info-type
	   #:info-version
	   #:get-window-info
	   #:move-window
	   #:set-window-text
	   #:set-window-pos
	   #:invalidate-rect
	   #:invalidate-region 
	   #:paintstruct
	   #:paintstruct-hdc
	   #:paintstruct-erase
	   #:paintstruct-paint
	   #:paintstruct-restore
	   #:paintstruct-inc-update
	   #:paintstruct-foreign
	   #:foreign-paintstruct
	   #:begin-paint
	   #:end-paint
	   #:with-paint
	   #:draw-caption
	   #:draw-focus-rect
	   #:draw-edge
	   #:redraw-window
	   #:text-out
	   #:get-client-rect
	   #:flash-window
	   #:message-beep
	   #:client-to-screen
	   #:get-window-rect
	   #:get-system-metrics
	   #:register-hot-key
	   #:unregister-hot-key
	   #:encode-rgb
	   #:decode-rgb
	   #:create-solid-brush
	   #:create-pen
	   #:virtual-key-code
	   #:virtual-code-key
	   #:create-menu
	   #:append-menu
	   #:set-menu
	   #:create-popup-menu
	   #:delete-menu
	   #:destroy-menu
	   #:track-popup-menu
	   #:check-menu-item 
	   #:check-menu-radio-item
	   #:get-menu-state
	   #:init-common-controls
	   #:choose-color
	   #:get-open-file-name
	   #:get-save-file-name
	   #:set-background-color
	   #:ext-text-out
	   #:is-dialog-button-checked
	   #:check-dialog-button
	   #:select-object
	   #:delete-object
	   #:set-timer
	   #:kill-timer
	   #:rectangle
	   #:draw-text
	   #:set-pixel
	   #:get-pixel
	   #:move-to
	   #:line-to
	   #:poly-bezier
	   #:create-hatch-brush
	   #:create-pattern-brush
	   #:create-bitmap
	   #:get-window-text-length
	   #:get-window-text
	   #:with-tool-info
	   #:make-long
	   #:make-lparam
	   #:loword
	   #:hiword
	   #:nmhdr 
	   #:foreign-nmhdr
	   #:nmhdr-foreign
	   #:updown
	   #:foreign-updown
	   #:updown-foreign
	   #:systemtime
	   #:systemtime-year
	   #:systemtime-month
	   #:systemtime-day-of-week
	   #:systemtime-day
	   #:systemtime-hour
	   #:systemtime-minute
	   #:systemtime-second
	   #:systemtime-milli
	   #:foreign-systemtime
	   #:systemtime-foreign
	   #:tcitem
	   #:tcitem-mask
	   #:tcitem-state
	   #:tcitem-state-mask
	   #:tcitem-text
	   #:tcitem-image
	   #:tcitem-lparam
	   #:foreign-tcitem
	   #:tcitem-foreign
	   #:create-font
	   #:enum-font-families 
	   #:set-bk-mode
	   #:set-bk-color 
	   #:ext-create-pen
	   #:polygon
	   #:ellipse
	   #:round-rect
	   #:chord
	   #:polyline
	   #:bit-blt
	   #:mask-blt 
	   #:plg-blt 
	   #:stretch-blt 
	   #:transparent-blt
	   #:pat-blt 
	   #:set-stretch-blt-mode 
	   #:get-stretch-blt-mode 
	   #:create-compatible-dc
	   #:bitmap
	   #:bitmap-type
	   #:bitmap-width
	   #:bitmap-height
	   #:bitmap-width-bytes
	   #:bitmap-planes
	   #:bitmap-bits-per-pixel
	   #:bitmap-bits
	   #:extlogpen
	   #:extlogpen-pen-style
	   #:extlogpen-width
	   #:extlogpen-brush-style
	   #:extlogpen-color
	   #:extlogpen-hatch
	   #:extlogpen-entries
	   #:logfont
	   #:logfont-height 
	   #:logfont-width
	   #:logfont-escapement
	   #:logfont-orientation
	   #:logfont-weight
	   #:logfont-italic
	   #:logfont-underline
	   #:logfont-strikeout
	   #:logfont-charset
	   #:logfont-out-precision
	   #:logfont-clip-precision
	   #:logfont-quality
	   #:logfont-pitch-and-family
	   #:logfont-name 
	   #:get-object
       #:create-dc 
	   #:delete-dc
	   #:nonclientmetrics
	   #:nonclientmetrics-size
	   #:nonclientmetrics-border-width
	   #:nonclientmetrics-scroll-width
	   #:nonclientmetrics-scroll-height
	   #:nonclientmetrics-caption-width
	   #:nonclientmetrics-caption-height
	   #:nonclientmetrics-caption-font
	   #:nonclientmetrics-small-caption-width
	   #:nonclientmetrics-small-caption-height
	   #:nonclientmetrics-small-caption-font
	   #:nonclientmetrics-menu-width
	   #:nonclientmetrics-menu-height
	   #:nonclientmetrics-menu-font
	   #:nonclientmetrics-status-font
	   #:nonclientmetrics-message-font
	   #:nonclientmetrics-padded-border-width
	   #:system-parameters-info
	   #:set-focus
	   #:get-focus 
	   #:createstruct
	   #:createstruct-param
	   #:createstruct-instance
	   #:createstruct-menu
	   #:createstruct-parent-hwnd
	   #:createstruct-cy
	   #:createstruct-cx
	   #:createstruct-y
	   #:createstruct-x
	   #:createstruct-styles
	   #:createstruct-name
	   #:createstruct-class-name
	   #:createstruct-ex-styles
	   #:foreign-createstruct
	   #:is-dialog-message
	   #:get-dc 
	   #:release-dc 
	   #:create-dialog 
	   #:dialog-box 
	   #:end-dialog
	   #:enable-window 
	   #:get-class-info
	   #:wndclassex
	   #:wndclassex-size
	   #:wndclassex-style
	   #:wndclassex-wndproc
	   #:wndclassex-class-extra
	   #:wndclassex-wnd-extra
	   #:wndclassex-instance
	   #:wndclassex-icon
	   #:wndclassex-cursor
	   #:wndclassex-brush
	   #:wndclassex-menu-name
	   #:wndclassex-class-name
	   #:wndclassex-icon-small
	   #:default-dialog-proc
	   #:is-window
	   #:get-dialog-item
	   #:get-dialog-control-id
	   #:get-next-dialog-tabl-item
	   #:map-dialog-rect
	   #:get-next-dialog-group-item
	   #:get-dialog-item-text
	   #:set-dialog-item-text 
	   #:send-dialog-item-message
	   #:create-accelerator-table
	   #:destroy-accelerator-table 	   
	   #:translate-accelerator
	   #:peek-message
	   #:get-menu
	   #:get-sub-menu
	   #:copy-accelerator-table
	   #:get-prop
	   #:set-prop
	   #:remove-prop
	   #:enum-props
	   #:set-class-pointer
	   #:get-class-pointer
	   #:set-window-pointer
	   #:get-window-pointer
	   #:set-active-window
	   #:get-foreground-window
	   #:set-foreground-window
	   #:wait-message
	   #:get-queue-status
	   #:msg-wait-for-multiple-objects
	   #:drag-accept-files
	   #:drag-finish
	   #:drag-query-files
	   #:drag-query-point
	   #:broadcast-system-message
	   #:reply-message
	   #:create-icon
	   #:create-cursor 
	   #:destroy-icon
	   #:draw-icon
	   #:get-device-caps
	   #:create-compatible-bitmap 
	   #:gradient-fill
	   #:set-text-color
	   #:get-text-color
	   #:create-font-indirect 
	   #:create-dib-section
	   #:set-di-bits
	   #:with-dc
	   #:with-compatible-dc
	   #:alpha-blend
	   #:choose-font
	   #:page-setup-dialog
	   #:print-dialog
	   #:free-findreplace 
	   #:get-findmsgstring
	   #:foreign-findreplace
	   #:find-text
	   #:replace-text
	   #:open-printer
	   #:start-doc-printer
	   #:start-page-printer
	   #:write-printer
	   #:end-page-printer
	   #:end-doc-printer
	   #:close-printer
	   #:create-caret 
	   #:destroy-caret
	   #:show-caret
	   #:hide-caret
	   #:get-caret-pos 
	   #:set-caret-pos 
	   #:get-text-extent-point
	   #:get-text-metrics 
	   #:get-keyboard-layout-name 
	   #:load-keyboard-layout 
	   #:is-window-enabled 
	   #:play-sound 
	   #:get-window 
       #:pie
       #:arc
       #:arc-to
       #:angle-arc
       #:set-arc-direction
       #:get-arc-direction
       #:set-scroll-info
       #:get-scroll-info
       #:scroll-window-ex
       #:show-scroll-bar
       #:enable-scroll-bar
       #:create-emf
       #:play-emf
       #:delete-emf
       #:with-emf
       #:get-emf-bits
       #:set-emf-bits
       #:with-emf-from-bits
       #:enum-display-devices
       #:start-doc
       #:start-page
       #:end-doc
       #:end-page
       
	   ;; ftw.lisp provides some extra useful utilities 
	   #:set-accelerator-table 
	   #:set-default-font 
	   #:default-message-loop
	   #:message-poll
	   #:create-bitmap-resource 
	   #:generate-bitmap-resource
	   #:generate-icon-resource
	   #:generate-cursor-resource 
	   #:get-default-font 
	   #:generate-resource-file
	   #:get-client-size
	   #:add-menu-bar
	   #:set-window-to-center 
	   #:with-double-buffering
       #:with-printer-dc
       #:print-page        

       #:treeview-insert-item
       #:treeview-delete-item
       #:treeview-delete-all-items
       #:treeview-expand
       #:treeview-select-drop-target
       #:treeview-get-edit-control
       #:treeview-set-imagelist 
       #:imagelist-create
       #:imagelist-add

       #:create-static
       #:create-edit
       #:create-button
       
       #:default-message-loop-multiple

       #:register-hwnd
       #:hwnd-by-name
       #:hwnd-by-id
       #:hwnd-name-by-id

       #:listview-insert-column
       #:listview-insert-item
       #:listview-set-item
       #:get-cursor-position
       #:screen-to-client
       #:foreign-nmlistview

       #:create-combobox
       #:combobox-add-string
       #:combobox-del-string
       #:combobox-selection
       #:combobox-show-dropdown
       #:combobox-reset-content

       #:alloc-console
       #:free-console
       #:create-console-screen-buffer
       #:open-console-std-input
       #:open-console-std-output
       #:set-console-active-screen-buffer
       #:char-info-attributes
       #:char-info
       #:string-info
       #:read-console-input
       #:read-console-output
       #:write-console-output
       #:set-console-cursor-position
       #:scroll-console-screen-buffer
       #:fill-console-output-character
       #:fill-console-output-attribute
       #:get-console-display-mode
       #:read-console
       #:get-console-cursor-info
       #:set-console-cursor-info
       #:write-console
       #:get-std-handle
       #:set-console-text-attribute
       #:attach-console
       #:get-console-window
       #:get-console-screen-buffer-info
       #:set-console-screen-buffer-info
       #:close-handle
       #:get-console--title
       #:get-number-of-console-input-events
       #:set-std-handle
       #:set-console-title
       #:flush-console-input-buffer
       #:get-console-mode
       #:set-console-mode
       #:console-mode
       #:console-modes

       #:get-current-console-font
       #:set-current-console-font
       #:set-console-screen-buffer-size
       
	   ))



