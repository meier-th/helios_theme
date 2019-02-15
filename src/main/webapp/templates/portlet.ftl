<#assign 
	portlet_display = portletDisplay
	portlet_id = htmlUtil.escapeAttribute(portlet_display.getId())
	portlet_title = htmlUtil.escape(portlet_display.getTitle())
	portlet_back_url = htmlUtil.escapeHREF(portlet_display.getURLBack())
/>

<section class="portlet" id="portlet_${portlet_id}">
	<header class="portlet-topper">
		<h1 class="portlet-title">
			<span class="portlet-title-text">${portlet_title}</span>
		</h1>
	
		<#-- <#foreach portletTitleMenu in portlet_title_menus>
					<menu class="portlet-topper-toolbar" id="portlet-title-menu_${portlet_id}_${portletTitleMenu_index}" type="toolbar">
						<@liferay_ui["menu"] menu=portletTitleMenu />
					</menu>
				</#foreach> -->
	
		<menu class="portlet-topper-toolbar" id="portlet-topper-toolbar_$portlet_id" type="toolbar">
			<#if portlet_display.isShowBackIcon()>
				<a class="icon-monospaced list-unstyled portlet-icon-back text-default" href="${portlet_back_url}">
					<@liferay.language key="return-to-full-page" />
				</a>
			</#if>
		</menu>
	</header>

	<div class="portlet-content">
		${portlet_display.writeContent(writer)}
	</div>
</section>