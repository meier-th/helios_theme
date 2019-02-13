<nav class="${nav_css_class}" id="navigation" role="navigation">
	<div class="navbar-inner">
		<div class="collapse">
			<ul aria-label="<@liferay.language key="site-pages" />" role="menubar">
				<#list nav_items as nav_item>
					<#assign 
						nav_item_attr_selected=""
						nav_item_attr_has_popup=""
						nav_item_caret=""
						nav_item_css_class="lfr-nav-item"
						nav_item_layout = nav_item.getLayout()
						nav_item_link_css_class="" 
					/>

					<#if nav_item.isSelected()>
						<#assign nav_item_attr_selected="aria-selected='true'">
						<#assign nav_item_css_class="selected">
					</#if>
					
					<#if nav_item.hasChildren()>
							<#assign nav_item_attr_has_popup="aria-haspopup='true'">
							<#assign nav_item_caret='<b class="icon-caret-down"></b>'>
							<#assign nav_item_css_class="${nav_item_css_class} dropdown">
							<#assign nav_item_link_css_class="dropdown-toggle">
						</#if>
					<#--<li class="${nav_item}_css_class" id="layout_${nav_item}.getLayoutId()" role="presentation">
						<a aria-labelledby="layout_${nav_item}.getLayoutId()" ${nav_item_attr_has_popup} href="${nav_item.getURL()}" ${nav_item.getTarget()} role="menuitem">
							<span><@liferay_theme["layout-icon"] layout=nav_item_layout /> ${nav_item.getName()}</span>
						</a> -->
					<li class="${nav_item_css_class}" id="layout_${nav_item.getLayoutId()}" role="presentation">
						<a aria-labelledby="layout_${nav_item.getLayoutId()}" ${nav_item_attr_has_popup} href="${nav_item.getURL()}" ${nav_item.getTarget()} role="menuitem">
							<span><@liferay_theme["layout-icon"] layout=nav_item_layout /> ${nav_item.getName()}</span>
						</a>
					
						

							<ul class="dropdown-menu" role="menu">
								<#list nav_item.getChildren() as nav_child>
									<#assign nav_child_attr_selected="">
									<#assign nav_child_css_class="lfr-nav-item">

									<#if nav_child.isSelected()>
										<#assign nav_child_attr_selected="aria-selected='true'">
										<#assign nav_child_css_class="selected">
									</#if>

									<li class="${nav_child_css_class}" id="layout_${nav_child.getLayoutId()}" role="presentation">
										<a aria-labelledby="layout_${nav_child.getLayoutId()}" class="child-element" href="${nav_child.getURL()}" ${nav_child.getTarget()} role="menuitem">${nav_child.getName()}</a>
									</li>
								</#list>
							</ul>
						
					</li>
				</#list>

				<#if !is_signed_in>
					<li class="last_element_in_list">
						<a data-redirect="${is_login_redirect_required?string}" href="${sign_in_url}" id="sign-in" rel="nofollow">${sign_in_text}</a>
					</li>
				<#else>
					<li class="last_element_in_list">
						<a href="${themeDisplay.getURLSignOut()}" id="sign-out"><@liferay.language key="sign-out" /></a>
					</li>
				</#if>
			</ul>
		</div>
	</div>
</nav>