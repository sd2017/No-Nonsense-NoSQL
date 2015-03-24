<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'product.label', default: 'Product')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#show-product" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="show-product" class="content scaffold-show" role="main">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <ol class="property-list product">
                <li class="fieldcontain">
                    <span id="name-label" class="property-label">Name</span>
                    <span class="property-value" aria-labelledby="name-label">${product.name}</span>
                </li>
                <li class="fieldcontain">
                    <span id="chapter-label" class="property-label">Chapter</span>
                    <span class="property-value" aria-labelledby="chapter-label"></span>
                </li>
                <li class="fieldcontain">
                    <span id="vendorUrl-label" class="property-label">Vendor Url</span>
                    <span class="property-value" aria-labelledby="vendorUrl-label">
                        <a href="${product.vendorUrl}" target="_blank">${product.vendorUrl}</a></span>
                </li>
                <li class="fieldcontain">
                    <span id="imageUrl-label" class="property-label">Preview Image</span>
                    <span class="property-value" aria-labelledby="imageUrl-label">
                        <g:if test="${product.imageUrl}"><img src="${assetPath(src: product.imageUrl)}" height="100px" width="100px"/></g:if></span>
                </li>

                <li class="fieldcontain">
                    <span id="priceQuantityRelations-label" class="property-label">Pricing</span>
                    <span class="property-value" aria-labelledby="priceQuantityRelations-label">
                        <g:each var="priceQuantityRelation" in="${product.priceQuantityRelations.sort{ it.quantity }}">
                            <p>${priceQuantityRelation.quantity} for ${priceQuantityRelation.price} <g:link controller="cart" action="add" id="${product.id}:${priceQuantityRelation.quantity}">Add to Cart</g:link></p>
                        </g:each>
                    </span>
                </li>

            </ol>
            <g:form resource="${product}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="edit" action="edit" resource="${product}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>