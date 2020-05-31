# Generated by Django 3.1 on 2020-05-18 02:17

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('architecture', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='architecture',
            name='architect',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.DO_NOTHING, to='architecture.architect'),
        ),
        migrations.AlterField(
            model_name='architecture',
            name='build_country',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.DO_NOTHING, to='architecture.country'),
        ),
    ]