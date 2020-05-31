# Generated by Django 3.0.5 on 2020-05-15 17:25

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('blog', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Article',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=70)),
                ('body', models.TextField()),
                ('created_time', models.DateTimeField()),
                ('modified_time', models.DateTimeField()),
                ('author', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
                ('caregory', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='blog.Category')),
                ('tag', models.ManyToManyField(blank=True, to='blog.Tag')),
            ],
        ),
        migrations.DeleteModel(
            name='Post',
        ),
    ]