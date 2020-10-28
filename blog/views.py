from django.shortcuts import render,get_object_or_404
from .models import Article, Category
from django.core.paginator import Paginator
from django.conf import settings
from common_func.utils import read_click, paginate
from django.contrib.contenttypes.fields import ContentType
from comment.models import Comment
from comment.forms import CommentForm
# Create your views here.


def blog_article(request, id):
    article = get_object_or_404(Article, id=id)
    key=read_click(request, obj=article)
    context = {}
    context['article'] = article
    context['object_id'] = id
    content_type = ContentType.objects.get_for_model(article)
    comments = Comment.objects.filter(content_type=content_type, object_id=id)
    context['comments'] = comments
    context['content_type'] = "article"    # 传入模型的名字。这里存在疑问。如果不同app有相同的article该怎么办
    context['commengt_form'] = CommentForm()
    response = render(request,"article_detail.html", context)    # 响应
    response.set_cookie(key, max_age=1200,)    # 给字典赋值真
    return response


def blog_list(request):
    context = {}
    articles_all = Article.objects.all()
    paginate(request,articles_all=articles_all,context=context)    # 分页器
    categorys = Category.objects.all()
    context['articles'] = articles_all
    context['categorys'] = categorys
    return render(request, "article_list.html", context)


def blog_category(request, id):
    context = {}
    category = get_object_or_404(Category,id=id)    #通过id=id获取分类的实例
    articles_category = Article.objects.filter(category=id)    #用分类筛选后的文章
    paginate(request,articles_all=articles_category,context=context)    # 分页器
    categorys = Category.objects.all()
    context["articles"] = articles_category
    context['categorys'] = categorys
    return render(request, "article_category.html", context)

