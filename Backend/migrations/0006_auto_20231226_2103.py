# Generated by Django 3.2.15 on 2023-12-26 20:03

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Backend', '0005_auto_20230211_0232'),
    ]

    operations = [
        migrations.AlterField(
            model_name='praesidiumfunctionyearmember',
            name='photo',
            field=models.ImageField(null=True, upload_to='praesidia/%Y/'),
        ),
        migrations.AlterField(
            model_name='profile',
            name='geslacht',
            field=models.CharField(blank=True, choices=[('MAN', 'Man'), ('ANDERS', 'Anders'), ('VROUW', 'Vrouw')], max_length=50),
        ),
        migrations.AlterField(
            model_name='profile',
            name='status',
            field=models.CharField(choices=[('DISABLED', 'Disabled'), ('ACTIVE', 'Active')], default='ACTIVE', max_length=50),
        ),
    ]