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
        <div class="bg">
            <div class="wrapper">
                <div class="content">
                    <#include "header.ftl">
                    <div class="body">
                        <div class="left main">
                            <div class="article">
                                <h2 class="article-title">
                                    <a class="no-underline" href="${servePath}${article.articlePermalink}">${article.articleTitle}</a>
                                    <#if article.articlePutTop>
                                    <sup class="red">
                                        ${topArticleLabel}
                                    </sup>
                                    </#if>
                                </h2>
                                <div class="margin5">
                                    <div class="article-date left">
                                        <a rel="nofollow" class="left" title="${article.authorName}" href="${servePath}/authors/${article.authorId}">
                                            <span class="authorIcon"></span>
                                            ${article.authorName}
                                        </a>
                                        <span class="dateIcon left"></span>
                                        ${article.articleUpdateDate?string("yyyy-MM-dd HH:mm:ss")}
                                    </div>
                                    <#if commentable>
                                    <div class="right">
                                        <a rel="nofollow" href="${servePath}${article.articlePermalink}#b3logsolocomments" class="left">
                                            <span class="left articles-commentIcon" title="${commentLabel}"></span>
                                            <span data-uvstatcmt="${article.oId}">${article.articleCommentCount}</span>
                                        </a>
                                    </div>
                                    </#if>
                                    <div class="clear"></div>
                                </div>
                                <div class="vditor-reset vditor-reset--article">
                                    ${article.articleContent}
                                    <#if "" != article.articleSign.signHTML?trim>
                                    <div class="marginTop12">
                                        ${article.articleSign.signHTML}
                                    </div>
                                    </#if>
                                </div>
                                <div class="margin5">
                                    <a rel="nofollow" class="left" href="${servePath}${article.articlePermalink}">
                                        <span title="${viewLabel}" class="left article-browserIcon"></span>
                                        <span data-uvstaturl="${servePath}${article.articlePermalink}">${article.articleViewCount}</span>
                                    </a>
                                    <div class="left">
                                        <span title="${tagLabel}" class="tagsIcon"></span>
                                        <#list article.articleTags?split(",") as articleTag>
                                        <span>
                                            <a rel="tag" href="${servePath}/tags/${articleTag?url('UTF-8')}">
                                                ${articleTag}</a><#if articleTag_has_next>,</#if>
                                        </span>
                                        </#list>
                                    </div>
                                    <div class="clear"></div>
                                </div>
                                <div>
                                    <#if nextArticlePermalink??>
                                    <div class="right">
                                        <a href="${servePath}${nextArticlePermalink}">${nextArticle1Label}${nextArticleTitle}</a>
                                    </div>
                                    <div class="clear"></div>
                                    </#if>
                                    <#if previousArticlePermalink??>
                                    <div class="right">
                                        <a href="${servePath}${previousArticlePermalink}">${previousArticle1Label}${previousArticleTitle}</a>
                                    </div>
                                    </#if>
                                    <div class="clear"></div>
                                </div>
                                <div id="relevantArticles" class="article-relative"></div>
                                <div id="randomArticles" class="article-relative"></div>
                                <div id="externalRelevantArticles" class="article-relative"></div>
                            </div>
                            <#if commentable>
                                <div id="b3logsolocomments"></div>
                                <div id="vcomment" class="comments"
                                 style="padding-top: 15px"
                                 data-name="${article.authorName}" data-postId="${article.oId}"></div>
                                <#if !staticSite>
                                <div id="soloComments" style="display: none;">
                                    <@comments commentList=articleComments article=article></@comments>
                                </div>
                                </#if>
                            </#if>
                        </div>
                        <div class="right">
                            <#include "side.ftl">
                        </div>
                        <div class="clear"></div>
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
        </div>
    </body>
</html>
