<#assign site_subheading = themeDisplay.getThemeSetting("site-subheading")>
<#assign site_header_icon = themeDisplay.getThemeSetting("site-header-icon")>
<#assign theme_color_main = themeDisplay.getThemeSetting("theme-color-main")>
<#assign theme_color_highlight = themeDisplay.getThemeSetting("theme-color-highlight")>

<#if !getterUtil.getBoolean(themeDisplay.getThemeSetting("portlet-setup-show-borders-default"))>
	<#assign css_class = "${css_class} borderless-default">
</#if>

<#assign show_dockbar = is_signed_in>

<#if getterUtil.getBoolean(themeDisplay.getThemeSetting("hide-dockbar"))>
	<#assign show_dockbar = is_signed_in && permissionChecker.isGroupAdmin(group_id)>
</#if>

<#if theme_display.getColorScheme().getCssClass() == 'dashboard' || (is_signed_in && getterUtil.getBoolean(themeDisplay.getThemeSetting("dashboard-view-for-logged-in-users")))>
	<#assign css_class = "${css_class} color-scheme-dashboard">
<#else>
	<#assign css_class = "${css_class} color-scheme-default">
</#if>