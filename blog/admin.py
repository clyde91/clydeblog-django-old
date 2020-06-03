from django.contrib import admin
from .models import Article,Category,Tag
# Register your models here.


@admin.register(Article)
class ArticleAdmin(admin.ModelAdmin):
    list_display = ("id", "title", "created_time", "modified_time","read_num",)
    list_per_page = 20
    ordering = ("id",)
    list_display_links = ("title",)
    # fields = ("title","body")


@admin.register(Category)
class CategoryAdmin(admin.ModelAdmin):
    list_display = ("id", "name", )
    ordering = ("id",)


admin.site.register(Tag)
