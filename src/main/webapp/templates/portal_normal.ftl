<!DOCTYPE html>

<#include init />

<html class="${root_css_class}" dir="<@liferay.language key="lang.dir" />" lang="${w3c_language_id}">

<head>
	<title>${the_title} - ${company_name}</title>

	<meta content="initial-scale=1.0, width=device-width" name="viewport" />

	<#include "${full_templates_path}/init_css.ftl">

	<@liferay_util["include"] page=top_head_include />
</head>

<body class="${css_class}">

<@liferay_ui["quick-access"] contentId="#main-content" />

<@liferay_util["include"] page=body_top_include />

	<@liferay.control_menu />

<div id="header-wrapper">
	<header id="banner" role="banner">
		<div id="heading">
			<h1 class="site-title">
				<a class="${logo_css_class}" href="/" title="<@liferay.language_format arguments="${site_name}" key="go-to-x" />">
					<img alt="${logo_description}" src="${site_logo}" width="120" />
				</a>
			</h1>
		</div>

		<#if is_setup_complete && ( has_navigation || is_signed_in ) >
			<#include "${full_templates_path}/navigation.ftl" />
		</#if>
	</header>
</div>

<div class="container-fluid" id="wrapper">
	<div id="subbanner">
		<span>site_subheading</span>
	</div>

	<section id="content">
	<h1 class="hide-accessible">${the_title}</h1>
		<nav id="breadcrumbs">
			<@liferay.breadcrumbs />
		</nav>

		<#if selectable>
			<@liferay_util["include"] page=content_include />
		<#else>
			${portletDisplay.recycle()}

			${portletDisplay.setTitle(the_title)}

			<@liferay_theme["wrap-portlet"] page="portlet.ftl"> 
				<@liferay_util["include"] page=content_include /> 
			</@>
		</#if>
	</section>
</div>

<@liferay_util["include"] page=body_bottom_include />

<@liferay_util["include"] page=bottom_include />

</body>

</html>