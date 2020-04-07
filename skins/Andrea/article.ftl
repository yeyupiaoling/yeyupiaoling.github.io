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
<#include "../../common-template/macro-common_head.ftl">
<#include "macro-comments.ftl">
<#include "../../common-template/macro-comment_script.ftl">
<!DOCTYPE html>
<html>
    <head>
        <@head title="${article.articleTitle} - ${blogTitle}" description="${article.articleAbstract?html}">
            <link rel="stylesheet"
                  href="${staticServePath}/skins/${skinDirName}/css/base.css?${staticResourceVersion}"/>
        <#if previousArticlePermalink??>
            <link rel="prev" title="${previousArticleTitle}" href="${servePath}${previousArticlePermalink}">
        </#if>
        <#if nextArticlePermalink??>
            <link rel="next" title="${nextArticleTitle}" href="${servePath}${nextArticlePermalink}">
        </#if>
        </@head>
    </head>
    <body>
        ${topBarReplacement}
        <#include "side-tool.ftl">
        <div class="wrapper">
            <#include "header.ftl">
            <div>
                <div class="main">
                    <div class="main-content">
                        <div class="article">
                            <div class="date">
                                <div class="month">${article.articleUpdateDate?string("MM")}</div>
                                <div class="day">${article.articleUpdateDate?string("dd")}</div>
                            </div>
                            <div class="left">
                                <h2 class="article-title">
                                    <a class="no-underline" href="${servePath}${article.articlePermalink}">${article.articleTitle}</a>
                                    <#if article.articlePutTop>
                                    <sup class="red">
                                        ${topArticleLabel}
                                    </sup>
                                    </#if>
                                </h2>
                                <div class="article-date">
                                    ${article.articleUpdateDate?string("yyyy HH:mm:ss")}
                                    by
                                    <a rel="nofollow" title="${article.authorName}" href="${servePath}/authors/${article.authorId}">
                                        ${article.authorName}</a>
                                    <#if commentable>
                                    |
                                    <a rel="nofollow" href="${servePath}${article.articlePermalink}#b3logsolocomments">
                                        <span data-uvstatcmt="${article.oId}">${article.articleCommentCount}</span> ${commentLabel}
                                    </a>
                                    </#if>
                                </div>
                            </div>
                            <div class="clear"></div>
                            <div class="vditor-reset vditor-reset--article">
                                ${article.articleContent}
                                <#if "" != article.articleSign.signHTML?trim>
                                <div class="marginTop12">
                                    ${article.articleSign.signHTML}
                                </div>
                                </#if>
                            </div>
                            <div class="right">
                                ${tag1Label}
                                <#list article.articleTags?split(",") as articleTag>
                                <span>
                                    <a rel="tag" href="${servePath}/tags/${articleTag?url('UTF-8')}">
                                        ${articleTag}</a><#if articleTag_has_next>,</#if>
                                </span>
                                </#list>
                                &nbsp;&nbsp;${viewCount1Label}
                                <a rel="nofollow" href="${servePath}${article.articlePermalink}" data-uvstaturl="${servePath}${article.articlePermalink}">${article.articleViewCount}</a>
                            </div>
                            <div class="clear"></div>
                            <div class="marginTop12">
                                <#if nextArticlePermalink??>
                                <a href="${servePath}${nextArticlePermalink}">${nextArticle1Label}${nextArticleTitle}</a>
                                <br>
                                </#if>
                                <#if previousArticlePermalink??>
                                <a href="${servePath}${previousArticlePermalink}">${previousArticle1Label}${previousArticleTitle}</a>
                                </#if>
                            </div>
                            <div id="relevantArticles" class="article-relative left relevantArticles"></div>
                            <div id="randomArticles"  class="article-relative left"></div>
                            <div class="clear"></div>
                            <div id="externalRelevantArticles" class="article-relative"></div>
                        </div>
                        <#if commentable>
                            <div id="b3logsolocomments"></div>
                            <div id="vcomment"
                                 style="border-top: 2px solid #3F3D36;margin-top: 30px;padding-top: 27px; padding-bottom: 30px;"
                                 data-name="${article.authorName}" data-postId="${article.oId}"></div>
                            <#if !staticSite>
                            <div id="soloComments" style="display: none;">
                                <@comments commentList=articleComments article=article></@comments>
                            </div>
                            </#if>
                        </#if>
                    </div>
                    <div class="main-footer"></div>
                </div>
                <div class="side-navi">
                    <#include "side.ftl">
                </div>
                <div class="clear"></div>
                <div class="brush">
                    <div class="brush-icon"></div>
                    <div id="brush"></div>
                </div>
                <div class="footer">
                    <#include "footer.ftl">
                </div>
            </div>
        </div>
        <@comment_script oId=article.oId commentable=article.commentable>
        page.tips.externalRelevantArticlesDisplayCount = "${externalRelevantArticlesDisplayCount}";
         <#if 0 != randomArticlesDisplayCount>
        page.loadRandomArticles();
        </#if>
        <#if 0 != relevantArticlesDisplayCount>
        page.loadRelevantArticles('${article.oId}', '<h4>${relevantArticles1Label}</h4>');
        </#if>
        <#if 0 != externalRelevantArticlesDisplayCount>
        page.loadExternalRelevantArticles("<#list article.articleTags?split(",") as articleTag>${articleTag}<#if articleTag_has_next>,</#if></#list>");
        </#if>
        </@comment_script>
    </body>
</html>
