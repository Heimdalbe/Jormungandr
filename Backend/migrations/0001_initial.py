# Generated by Django 3.2.15 on 2022-12-31 15:32

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion
import markdownx.models
import multiselectfield.db.fields


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='CMS',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=128)),
                ('title', models.CharField(max_length=128)),
                ('description', markdownx.models.MarkdownxField(default=None)),
                ('permission', models.IntegerField(choices=[(1, 'Admin'), (2, 'Developer'), (3, 'Praesidium'), (4, 'Lid'), (5, 'Anonymous')], default=5, help_text='Stel toegangsrechten voor de pagina in. Standaard: voor iedereen toegankelijk')),
            ],
            options={
                'verbose_name': 'Custom Pagina',
                'verbose_name_plural': "Custom Pagina's",
            },
        ),
        migrations.CreateModel(
            name='Election',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('titel', models.CharField(max_length=200)),
                ('uitleg', models.CharField(blank=True, max_length=200)),
                ('visible', models.BooleanField(default=False)),
                ('order', models.IntegerField(default=10)),
            ],
        ),
        migrations.CreateModel(
            name='EventGenre',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=64, unique=1)),
                ('description', markdownx.models.MarkdownxField(default=None)),
                ('logo', models.ImageField(upload_to='event_type')),
            ],
            options={
                'verbose_name': 'Event Genre',
                'verbose_name_plural': 'Event Genres',
            },
        ),
        migrations.CreateModel(
            name='FooterPage',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=128)),
                ('url', models.URLField()),
                ('order', models.IntegerField()),
            ],
            options={
                'ordering': ['order'],
            },
        ),
        migrations.CreateModel(
            name='NavTopItem',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('titel', models.CharField(max_length=128)),
                ('order', models.SmallIntegerField()),
                ('url', models.URLField(default='http://127.0.0.1:8000/')),
                ('role', models.IntegerField(choices=[(1, 'Admin'), (2, 'Developer'), (3, 'Praesidium'), (4, 'Lid'), (5, 'Anonymous')], default=5)),
            ],
            options={
                'verbose_name': 'Menu Header',
                'verbose_name_plural': 'Menu Headers',
            },
        ),
        migrations.CreateModel(
            name='PhotoAlbum',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100)),
                ('created_at', models.DateTimeField()),
                ('order', models.SmallIntegerField()),
                ('visible', models.BooleanField(default=True)),
            ],
            options={
                'verbose_name': 'Photo Album',
                'verbose_name_plural': 'Photo Albums',
            },
        ),
        migrations.CreateModel(
            name='PraesidiumFunction',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=50)),
                ('email', models.EmailField(max_length=254)),
                ('order', models.SmallIntegerField()),
            ],
            options={
                'verbose_name': 'Praesidium Functie',
                'verbose_name_plural': 'Praesidium Functies',
            },
        ),
        migrations.CreateModel(
            name='PraesidiumMember',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('first_name', models.CharField(max_length=50)),
                ('last_name', models.CharField(max_length=100)),
                ('email', models.EmailField(max_length=254)),
                ('phone', models.CharField(blank=True, max_length=20, null=True)),
                ('photo', models.URLField(null=True)),
                ('quote', models.CharField(blank=True, max_length=200, null=True)),
                ('description', models.CharField(blank=True, max_length=200, null=True)),
                ('trivia', markdownx.models.MarkdownxField()),
                ('facebook_link', models.URLField(blank=True, null=True)),
                ('linkedin_link', models.URLField(blank=True, null=True)),
                ('twitter_link', models.URLField(blank=True, null=True)),
                ('instagram_link', models.URLField(blank=True, null=True)),
            ],
            options={
                'verbose_name': 'Data Praesidium Lid',
                'verbose_name_plural': 'Data Praesidium Leden',
            },
        ),
        migrations.CreateModel(
            name='PraesidiumYear',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('start', models.DateTimeField()),
                ('end', models.DateTimeField()),
            ],
            options={
                'verbose_name': 'Praesidium Werkjaar',
                'verbose_name_plural': 'Praesidium Werkjaren',
            },
        ),
        migrations.CreateModel(
            name='Round',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('titel', models.CharField(max_length=200)),
                ('actief', models.BooleanField(default=True)),
                ('visible', models.BooleanField(default=False)),
                ('resultatenactief', models.BooleanField(default=False)),
                ('election', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='Backend.election')),
            ],
        ),
        migrations.CreateModel(
            name='Sponsor',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100, unique=True)),
                ('website', models.URLField()),
                ('logo', models.ImageField(null=True, upload_to='sponsor')),
                ('inverted_color', models.BooleanField(default=False)),
            ],
        ),
        migrations.CreateModel(
            name='Profile',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('gsm', models.CharField(blank=True, max_length=50)),
                ('geslacht', models.CharField(blank=True, choices=[('VROUW', 'Vrouw'), ('MAN', 'Man'), ('ANDERS', 'Anders')], max_length=50)),
                ('interesses', multiselectfield.db.fields.MultiSelectField(blank=True, choices=[('GAMES', 'Games'), ('ANIME', 'Anime'), ('COSPLAY', 'Cosplay'), ('TABLETOPS', 'Tabletop Games'), ('SUPERHEROES', 'Superheroes')], max_length=41)),
                ('mails', models.BooleanField(default=False)),
                ('policy_approved', models.BooleanField(default=False)),
                ('votes', models.PositiveSmallIntegerField(default=1)),
                ('status', models.CharField(choices=[('DISABLED', 'Disabled'), ('ACTIVE', 'Active')], default='ACTIVE', max_length=50)),
                ('role', models.IntegerField(choices=[(1, 'Admin'), (2, 'Developer'), (3, 'Praesidium'), (4, 'Lid'), (5, 'Anonymous')], default=5)),
                ('election_active', models.BooleanField(default=False)),
                ('user', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='PraesidiumFunctionYearMember',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('praesidium_function', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='Backend.praesidiumfunction')),
                ('praesidium_member', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='Backend.praesidiummember')),
                ('praesidium_year', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='Backend.praesidiumyear')),
            ],
            options={
                'verbose_name': 'Praesidium Lid',
                'verbose_name_plural': 'Praesidium Leden',
            },
        ),
        migrations.CreateModel(
            name='Picture',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100)),
                ('description', models.CharField(blank=True, max_length=300, null=True)),
                ('link', models.CharField(max_length=150, unique=True)),
                ('is_carousel_pic', models.BooleanField(default=False)),
                ('album', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='Backend.photoalbum')),
            ],
        ),
        migrations.CreateModel(
            name='NavSubItem',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('titel', models.CharField(max_length=128)),
                ('order', models.SmallIntegerField()),
                ('url', models.URLField(default='http://127.0.0.1:8000/')),
                ('parent', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='Backend.navtopitem')),
            ],
            options={
                'verbose_name': 'Menu Item',
                'verbose_name_plural': 'Menu Items',
            },
        ),
        migrations.CreateModel(
            name='GraphNode',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=128)),
                ('photo', models.URLField(max_length=256)),
                ('display', models.CharField(choices=[('Full name', 'Full'), ('First name full, last name initial', 'Firstnamefull'), ('Initials', 'Initials'), ('First name initial', 'Firstinitial'), ('None', 'None')], default='None', max_length=50)),
                ('parent', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='Backend.graphnode')),
            ],
        ),
        migrations.CreateModel(
            name='Event',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=128)),
                ('description', markdownx.models.MarkdownxField(default=None, null=True)),
                ('url', models.CharField(blank=True, max_length=1024, null=True)),
                ('poster', models.ImageField(upload_to='events')),
                ('start', models.DateTimeField(null=True)),
                ('end', models.DateTimeField(null=True)),
                ('location', models.CharField(max_length=256)),
                ('is_open', models.BooleanField(default=1)),
                ('max_registered', models.PositiveSmallIntegerField(blank=True, null=True)),
                ('genre', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='Backend.eventgenre')),
            ],
        ),
        migrations.CreateModel(
            name='Choice',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('keuze', models.CharField(max_length=200)),
                ('votes', models.IntegerField(default=0, editable=False)),
                ('round', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='Backend.round')),
            ],
        ),
        migrations.CreateModel(
            name='UserVotes',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('votes', models.IntegerField(default=0)),
                ('round', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='round_votes', to='Backend.round')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='user_votes', to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'unique_together': {('user', 'round')},
            },
        ),
    ]
