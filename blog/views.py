from django.shortcuts import render,get_object_or_404
from .models import Article, Category
from django.core.paginator import Paginator
from django.conf import settings
from common_func.utils import read_click
# Create your views here.


def blog_article(request,id):
    article = get_object_or_404(Article, id=id)
    key=read_click(request, obj=article)
    context = {}
    context['article'] = article
    response = render(request,"article_detail.html", context)    # 响应
    response.set_cookie(key, max_age=1200,)    # 给字典赋值真
    return response

def blog_list(request):
    context = {}
    articles_all = Article.objects.all()
    paginator = Paginator(articles_all,settings.NUM_ARTICLE_PER_PAGE)#每8页分页
    page_num = request.GET.get('page',1)#get获取页码
    page = paginator.get_page(page_num)#当前页
    nav_page_range = [x for x in range(int(page_num)-2, int(page_num)+3) if 0 < x <= paginator.num_pages]#前后各2个。如果前面取到小于1就取1。后面取到最后页码就取最后页码
    #加首页尾页省略号
    if nav_page_range[0] != 1:
        nav_page_range.insert(0,1)
        if nav_page_range[1]-1>=2:
            nav_page_range.insert(1,'...')
    if nav_page_range[-1] != paginator.num_pages:
        nav_page_range.append(paginator.num_pages)
        if paginator.num_pages-nav_page_range[-2]>=2:
            nav_page_range.insert(-1,'...')
    categorys = Category.objects.all()
    context['articles'] = articles_all
    context['categorys'] = categorys
    context['page'] = page
    context['page_num'] = page_num
    context['nav_page_range'] = nav_page_range
    return render(request, "article_list.html", context)


def blog_category(request,id):
    context = {}
    category = get_object_or_404(Category,id=id)    #通过id=id获取分类的实例
    articles_category = Article.objects.filter(category=id)    #用分类筛选后的文章
    paginator = Paginator(articles_category,settings.NUM_ARTICLE_PER_PAGE)#每4页分页
    page_num = request.GET.get('page',1)#get获取页码
    page = paginator.get_page(page_num)#通过页码获得页面
    nav_page_range = [x for x in range(max(1,page.number-2),min(page.number+3,paginator.num_pages+1))]#与前者一样的不同写法。前者好
    categorys = Category.objects.all()
    context["articles"] = articles_category
    context['page'] = page
    context['categorys'] = categorys
    context['page_num'] = page_num
    context['nav_page_range'] = nav_page_range
    return render(request, "article_category.html", context)

