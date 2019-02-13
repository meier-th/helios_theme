<nav class="${nav_css_class}" id="navigation" role="navigation">
	<div class="navbar-inner">
		<#--<div class="nav-helpers">
			<ol class="nav nav-pills">
				<li class="nav-item-sitenavigationtoggle">
					<a href="#"><i class="icon-reorder"></i>
						<@liferay.language key="menu"/>
					</a>
				</li>
				<#if show_dockbar>
					<li class="nav-item-dockbartoggle">
						<a href="#"><i class="icon-gear"></i></a>
					</li>
				</#if>
			</ol>
		</div> -->

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
						<#assign nav_item_css_class="${nav_item}_css_class selected active">
					</#if>
					<#--
					<li class="${nav_item_css_class}" id="layout_${nav_item.getLayoutId()}" role="presentation">
					<a aria-labelledby="layout_${nav_item.getLayoutId()}" ${nav_item_attr_has_popup} href="${nav_item.getURL()}" ${nav_item.getTarget()} role="menuitem"><span><@liferay_theme["layout-icon"] layout=nav_item_layout /> ${nav_item.getName()}</span></a>
					-->
					<#if nav_item.hasChildren()>
						<#assign nav_item_attr_has_popup="aria-haspopup='true'">
						<#assign nav_item_caret='<b class="icon-caret-down"></b>'>
						<#assign nav_item_css_class="$nav_item_css_class dropdown">
						<#assign nav_item_link_css_class="dropdown-toggle">
					</#if>

					<li class="${nav_item}_css_class" id="layout_${nav_item}.getLayoutId()" nav_item_attr_selected role="presentation">
						<a aria-labelledby="layout_${nav_item}.getLayoutId()" nav_item_attr_has_popup class="${nav_item}_link_css_class" href="${nav_item.getURL()}" nav_item.getTarget() role="menuitem">
							<span>${(nav_item.icon())!""} ${nav_item.getName()} ${nav_item_caret}</span>
						</a>

						<#if nav_item.hasChildren()>
							<ul class="dropdown-menu child-menu" role="menu">
								<#list nav_item.getChildren() as nav_child>
									<#assign nav_child_attr_selected="">
									<#assign nav_child_css_class="lfr-nav-item">

									<#if nav_child.isSelected()>
										<#assign nav_child_attr_selected="aria-selected='true'">
										<#assign nav_child_css_class="selected">
									</#if>

									<li class="${nav_child_css_class}" id="layout_${nav_child.getLayoutId()}" role="presentation">
										<#-- may be a mistake here, see upgrading theme from 6.2 to 7.1 guide, template updating part -->
										<a aria-labelledby="layout_${nav_child.getLayoutId()}" href="${nav_child.getURL()}" ${nav_child.getTarget()} role="menuitem">${nav_child.getName()}</a>
									</li>
								</#list>
							</ul>
						</#if>
					</li>
				</#list>

				<#if !is_signed_in>
					<li>
						<a data-redirect="${is_login_redirect_required?string}" href="${sign_in_url}" id="sign-in" rel="nofollow">${sign_in_text}</a>
					</li>
				<#else>
					<li>
						<a href="${themeDisplay.getURLSignOut()}" id="sign-out"><@liferay.language key="sign-out" /></a>
					</li>
				</#if>
			</ul>
		</div>
	</div>
</nav>

<script>
	Liferay.Data.NAV_LIST_SELECTOR = '.navbar-inner .nav-collapse > ul';
</script>