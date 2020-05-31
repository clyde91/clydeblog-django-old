#模板全局变量


from blog.models import Category


def global_params(request):

    categorys = Category.objects.all()

    return {
        'categorys': categorys,
    }