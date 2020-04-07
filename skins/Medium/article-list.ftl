<#--

    Solo - A small and beautiful blogging system written in Java.
    Copyright (c) 2010-present, b3log.org

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.

    You should have received a copy of the GNU Affero General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.

-->
<div class="fn-clear article__wrap">
<#list articles as article>
    <article class="article__item
    <#if article_index == 0 || article_index == 10>article__item--big
    <#elseif article_index &gt; 0 && article_index &lt; 5>article__item--small
    <#elseif article_index &gt; 4 && article_index &lt; 8>article__item--big
    <#elseif article_index == 8 || article_index == 9>article__item--mid
    <#elseif article_index &gt; 10 && article_index &lt; 15>article__item--small
    <#elseif article_index &gt; 14 && article_index &lt; 18>article__item--big
    <#elseif article_index &gt; 17 && article_index &lt; 20>article__item--mid
    <#else>article__item--big
    </#if>">
        <header class="article__panel">
            <div class="article__main">
                <h2 class="article__title">
                    <a rel="bookmark" href="${servePath}${article.articlePermalink}">
                    ${article.articleTitle}
                    </a>
                    <#if article.articlePutTop>
                        <sup>
                        ${topArticleLabel}
                        </sup>
                    </#if>
                    <#if article.hasUpdated>
                        <sup>
                            <a href="${servePath}${article.articlePermalink}">
                                ${updatedLabel}
                            </a>
                        </sup>
                    </#if>
                </h2>
                <div class="article__thumbnail" style="background-image: url(${article.articleImg1URL})"/>
            </div>

            <div class="article__meta ft-gray fn-flex">
                <time>
                ${article.articleUpdateDate?string("yyyy-MM-dd")}
                </time> &nbsp;•&nbsp;
                <#if commentable>
                <a href="${servePath}${article.articlePermalink}#b3logsolocomments" class="ft-gray">
                    <span data-uvstatcmt="${article.oId}">${article.articleCommentCount}</span> ${commentLabel}
                </a> &nbsp;•&nbsp;
                </#if>
                <a href="${servePath}${article.articlePermalink}" class="ft-gray">
                    <span data-uvstaturl="${servePath}${article.articlePermalink}">${article.articleViewCount}</span> ${viewLabel}
                </a>
            </div>
        </header>
    </article>
</#list>
</div>

<#if 0 != paginationPageCount>
<nav class="pagination">
    <#if 1 != paginationPageNums?first>
        <a href="${servePath}${path}${pagingSep}${paginationPreviousPageNum}" class="pagination__item">&laquo;</a>
        <a class="pagination__item" href="${servePath}${path}">1</a>
        <span class="pagination__item pagination__omit">...</span>
    </#if>
    <#list paginationPageNums as paginationPageNum>
        <#if paginationPageNum == paginationCurrentPageNum>
            <span class="pagination__item pagination__item--active">${paginationPageNum}</span>
        <#else>
            <a class="pagination__item" href="${servePath}${path}${pagingSep}${paginationPageNum}">${paginationPageNum}</a>
        </#if>
    </#list>
    <#if paginationPageNums?last != paginationPageCount>
        <span class="pagination__item pagination__omit">...</span>
        <a href="${servePath}${path}${pagingSep}${paginationPageCount}" class="pagination__item">${paginationPageCount}</a>
        <a href="${servePath}${path}${pagingSep}${paginationNextPageNum}" class="pagination__item">&raquo;</a>
    </#if>
</nav>
</#if>
