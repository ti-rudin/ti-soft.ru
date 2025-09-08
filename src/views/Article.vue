<template>
  <div class="max-w-6xl mx-auto p-6 bg-gray-50 dark:bg-gray-900 min-h-screen text-gray-700 dark:text-gray-300">
    <!-- Article Header -->
    <div class="mb-12 text-center">
      <div class="flex flex-wrap justify-center gap-2 mb-6">
        <span 
          v-for="(tag, index) in article.tags" 
          :key="index"
          class="px-3 py-1 rounded-full text-sm font-medium"
          :class="{
            'bg-indigo-100 dark:bg-indigo-900 text-indigo-800 dark:text-indigo-200': index === 0,
            'bg-gray-100 dark:bg-gray-700 text-gray-800 dark:text-gray-200': index !== 0
          }">
          {{ tag }}
        </span>
      </div>
      <h1 class="text-3xl md:text-4xl font-bold mb-4 text-gray-900 dark:text-white">
        {{ article.title[currentLanguage] }}
      </h1>
      <div class="flex items-center justify-center text-gray-500 dark:text-gray-400">
        <span class="mr-4">{{ article.date[currentLanguage] }}</span>
        <span>{{ article.readTime[currentLanguage] }}</span>
      </div>
    </div>

    <!-- Article Image -->
    <div class="mb-12 h-96 bg-gray-200 dark:bg-gray-700 rounded-xl flex items-center justify-center">
      <span class="text-8xl">{{ article.emoji }}</span>
    </div>

    <!-- Article Content -->
    <article class="prose dark:prose-invert max-w-3xl mx-auto mb-16">
      <p>{{ article.content.introText[currentLanguage] }}</p>
      <p>{{ article.body }}</p>
      <p>{{ article.content.conclusionText[currentLanguage] }}</p>

      <!--
      <h2>{{ article.content.intro[currentLanguage] }}</h2>
      <p>{{ article.content.introText[currentLanguage] }}</p>
      
      <h2>{{ article.content.features[currentLanguage] }}</h2>
      <ul>
        <li v-for="(feature, index) in article.content.featureList[currentLanguage]" :key="index">
          {{ feature }}
        </li>
      </ul>

      <h2>{{ article.content.conclusion[currentLanguage] }}</h2>
      <p>{{ article.content.conclusionText[currentLanguage] }}</p>

      <div class="bg-blue-50 dark:bg-blue-900 p-6 rounded-xl border border-blue-200 dark:border-blue-800">
        <h3 class="text-blue-800 dark:text-blue-200 mt-0">{{ article.content.tip[currentLanguage] }}</h3>
        <p class="text-blue-700 dark:text-blue-300 mb-0">{{ article.content.tipText[currentLanguage] }}</p>
      </div>
      -->

    </article>

    <!-- Author Info -->
    <div class="max-w-3xl mx-auto mb-16 p-6 bg-white dark:bg-gray-800 rounded-xl shadow-sm">
      <div class="flex items-center">
        <div class="w-16 h-16 rounded-full bg-gray-300 dark:bg-gray-600 flex items-center justify-center mr-4">
          <span class="text-2xl">👨‍💻</span>
        </div>
        <div>
          <h3 class="text-lg font-semibold text-gray-900 dark:text-white">{{ article.author.name[currentLanguage] }}</h3>
          <p class="text-gray-600 dark:text-gray-300">{{ article.author.position[currentLanguage] }}</p>
        </div>
      </div>
    </div>

    <!-- Related Articles -->
    <section class="mb-16">
      <h2 class="text-2xl font-semibold mb-8 text-center text-gray-900 dark:text-white">
        {{ translations.relatedArticles[currentLanguage] }}
      </h2>
      <div class="grid md:grid-cols-3 gap-8">
        <router-link 
          v-for="(item, index) in relatedArticles" 
          :key="index"
          :to="'/article/' + item.slug"
          class="bg-white dark:bg-gray-800 rounded-xl overflow-hidden shadow-md hover:shadow-lg transition-all hover:-translate-y-1">
          <div class="h-40 bg-gray-200 dark:bg-gray-700 flex items-center justify-center">
            <span class="text-4xl">{{ item.emoji }}</span>
          </div>
          <div class="p-6">
            <div class="flex flex-wrap gap-2 mb-3">
              <span 
                v-for="(tag, tagIndex) in item.tags" 
                :key="tagIndex"
                class="px-2 py-1 bg-gray-100 dark:bg-gray-700 text-gray-800 dark:text-gray-200 rounded-full text-xs font-medium">
                {{  (translations.tags[tag] && translations.tags[tag][currentLanguage]) || tag }}
              </span>
            </div>
            <h3 class="text-lg font-bold mb-2 text-gray-900 dark:text-white">
              {{ (item.title && item.title[currentLanguage]) || 'Без названия' }}
            </h3>
            <div class="flex items-center justify-between text-xs text-gray-500 dark:text-gray-400">
              <span>{{ (item.date && item.date[currentLanguage]) || '' }}</span>
              <span>{{ (item.readTime && item.readTime[currentLanguage]) || '' }}</span>
            </div>
          </div>
        </router-link>
      </div>
    </section>
  </div>
</template>

<script>
import { ref, onMounted, watch  } from 'vue'
import { useRoute } from 'vue-router'
import { currentLanguage } from '../stores/language';

export default {
  name: 'BlogPost',
  setup() {
    const route = useRoute()
    const loading = ref(true)
    const error = ref(null)

    watch(
      () => route.params.id,
      (newId) => {
        if (newId) {
          fetchArticle(newId)
        }
      },
      { immediate: true }
    )
    const relatedArticles = ref({
      tags: [],
      title: { ru: '', en: '' },
      date: { ru: '', en: '' },
      readTime: { ru: '', en: '' },
      emoji: '',
      content: {
        intro: { ru: '', en: '' },
        introText: { ru: '', en: '' },
        features: { ru: '', en: '' },
        featureList: { ru: [], en: [] },
        conclusion: { ru: '', en: '' },
        conclusionText: { ru: '', en: '' },
        tip: { ru: '', en: '' },
        tipText: { ru: '', en: '' }
      },
      author: {
        name: { ru: '', en: '' },
        position: { ru: '', en: '' }
      }
    })
    const article = ref({
      tags: [],
      title: { ru: '', en: '' },
      date: { ru: '', en: '' },
      readTime: { ru: '', en: '' },
      emoji: '',
      content: {
        intro: { ru: '', en: '' },
        introText: { ru: '', en: '' },
        features: { ru: '', en: '' },
        featureList: { ru: [], en: [] },
        conclusion: { ru: '', en: '' },
        conclusionText: { ru: '', en: '' },
        tip: { ru: '', en: '' },
        tipText: { ru: '', en: '' }
      },
      author: {
        name: { ru: '', en: '' },
        position: { ru: '', en: '' }
      }
    })

    function calculateReadTime(text) {
      if (!text) return 0;
      const wordCount = text.trim().split(/\s+/).length;
      return Math.max(1, Math.ceil(wordCount / 200));
    }


    async function fetchRelArticle(currentArticleId, currentTags = []) {
      try {
        loading.value = true;
        const response = await fetch('https://api.github.com/repos/ti-rudin/ti-robots.ru/issues');
        
        if (!response.ok) throw new Error('Не удалось загрузить статьи');
        
        const allIssues = await response.json();
        
        if (!Array.isArray(allIssues)) {
          throw new Error('Некорректный формат статей');
        }
        
        const filteredIssues = allIssues.filter(issue => {
          try {
            if (!issue || !issue.number) return false;
            if (issue.number.toString() === currentArticleId) return false;
            
            if (!Array.isArray(currentTags) || !currentTags.length) return true;
            
            const issueTags = Array.isArray(issue.labels) 
              ? issue.labels.map(label => label?.name?.toLowerCase() || '').filter(Boolean)
              : [];
              
            return issueTags.some(tag => currentTags.includes(tag));
          } catch (err) {
            console.error('Ошибка фильтрации статьи:', issue, err);
            return false;
          }
        });
        
        const sortedIssues = filteredIssues
          .sort((a, b) => new Date(b?.created_at || 0) - new Date(a?.created_at || 0))
          .slice(0, 3);
        
        relatedArticles.value = sortedIssues.map(issue => ({
          slug: issue?.number?.toString() || '',
          title: {
            ru: issue?.title || 'Без названия',
            en: issue?.title || ''
          },
          tags: Array.isArray(issue.labels) 
            ? issue.labels.map(label => label?.name?.toLowerCase() || '').filter(Boolean)
            : [],
          date: {
            ru: issue?.created_at ? new Date(issue.created_at).toLocaleDateString('ru-RU') : '',
            en: issue?.created_at ? new Date(issue.created_at).toLocaleDateString('en-US') : ''
          },
          readTime: {
            ru: `${calculateReadTime(issue?.body || '')} мин чтения`,
            en: `${calculateReadTime(issue?.body || '')} min read`
          },
          emoji: '🤖'
        }));
        
      } catch (err) {
        console.error('Ошибка загрузки похожих статей:', err);
        relatedArticles.value = [];
      } finally {
        loading.value = false;
      }
    }


    async function fetchArticle(id) {
      try {
        loading.value = true
        const response = await fetch(`https://api.github.com/repos/ti-rudin/ti-robots.ru/issues/${id}`)
        if (!response.ok) throw new Error('Статья не найдена')
        
        const data = await response.json()
        const currentTags = data.labels?.map(label => label.name.toLowerCase()) || [];

        article.value = {
          tags: data.labels?.map(label => label.name.toLowerCase()) || [],
          title: {
            ru: data.title || 'Без названия',
            en: ''
          },
          date: {
            ru: new Date(data.created_at).toLocaleDateString('ru-RU'),
            en: new Date(data.created_at).toLocaleDateString('en-US')
          },
          body: data.body.split('\n\n').slice(1, -1).join('\n\n') || '',
          content: {
            introText: {
              ru: data.body?.split('\n\n')[0] || 'Введение отсутствует',
              en: ''
            },
            conclusionText: {
              ru: data.body?.split('\n\n').slice(-1)[0] || 'Заключение отсутствует',
              en: ''
            }
          },
          author: {
            name: {
              ru: data.user?.login || 'Автор',
              en: data.user?.login || 'Author'
            },
            position: {
              ru: 'Автор статьи',
              en: 'Article author'
            }
          },
          emoji: '🤖',
          readTime: {
            ru: `${calculateReadTime(data.body)} мин чтения`,
            en: `${calculateReadTime(data.body)} min read`
          }
        }
        await fetchRelArticle(
  route.params.id, 
  data.labels?.map(label => label.name.toLowerCase()) || []
);

      } catch (err) {
        error.value = err.message
        console.error('Ошибка загрузки:', err)
      } finally {
        loading.value = false
      }
    }

    onMounted(() => {
      if (route.params.id) {
        fetchArticle(route.params.id);
      }
    })

    const translations = {
      tags: {
        automation: {
          ru: 'Автоматизация',
          en: 'Automation'
        },
        trading: {
          ru: 'Трейдинг',
          en: 'Trading'
        },
        algorithms: {
          ru: 'Алгоритмы',
          en: 'Algorithms'
        },
        caseStudy: {
          ru: 'Кейсы',
          en: 'Case Studies'
        }
      },
      content: {
        intro: {
          ru: 'Введение',
          en: 'Introduction'
        },
        introText: {
          ru: 'В этой статье мы рассмотрим ключевые аспекты оптимизации нашего TSL бота для платформы Binance. За последние 3 месяца мы добились увеличения производительности на 37%, и готовы поделиться нашим опытом.',
          en: 'In this article, we will explore key aspects of optimizing our TSL bot for the Binance platform. Over the past 3 months, we achieved a 37% performance improvement and are ready to share our experience.'
        },
        features: {
          ru: 'Ключевые улучшения',
          en: 'Key Improvements'
        },
        featureList: {
          ru: [
            'Оптимизация алгоритма trailing stop loss',
            'Улучшение обработки рыночных данных',
            'Снижение задержек при исполнении ордеров',
            'Интеграция с Binance API v3'
          ],
          en: [
            'Optimization of the trailing stop loss algorithm',
            'Improved market data processing',
            'Reduced order execution latency',
            'Integration with Binance API v3'
          ]
        },
        conclusion: {
          ru: 'Заключение',
          en: 'Conclusion'
        },
        conclusionText: {
          ru: 'Реализованные изменения позволили значительно улучшить показатели нашего бота. В ближайших планах - дальнейшая оптимизация и добавление новых функций.',
          en: 'The implemented changes have significantly improved our bot performance. Future plans include further optimization and adding new features.'
        },
        tip: {
          ru: 'Совет эксперта',
          en: 'Expert Tip'
        },
        tipText: {
          ru: 'Для достижения лучших результатов настройте параметры бота под вашу торговую стратегию и волатильность рынка.',
          en: 'For best results, adjust the bot parameters according to your trading strategy and market volatility.'
        }
      },
      author: {
        name: {
          ru: 'Василий Прохожев',
          en: 'Vasily Prokhozhev'
        },
        position: {
          ru: 'Главный разработчик TSL Bot',
          en: 'Lead Developer of TSL Bot'
        }
      },
      relatedArticles: {
        ru: 'Похожие статьи',
        en: 'Related Articles'
      },
      comments: {
        ru: 'Комментарии',
        en: 'Comments'
      },
      commentText: {
        ru: 'Отличная статья! Уже пробовал применить эти методы на практике - действительно работает. Жду новых статей по теме.',
        en: 'Great article! Already tried these methods in practice - really works. Looking forward to new articles on the topic.'
      },
      commentText2: {
        ru: 'Интересно, планируете ли вы поддержку других бирж кроме Binance? Было бы полезно для диверсификации.',
        en: 'Interesting, are you planning to support other exchanges besides Binance? It would be useful for diversification.'
      },
      addComment: {
        ru: 'Добавить комментарий',
        en: 'Add Comment'
      },
      form: {
        name: {
          ru: 'Ваше имя',
          en: 'Your Name'
        },
        comment: {
          ru: 'Ваш комментарий',
          en: 'Your Comment'
        },
        submit: {
          ru: 'Отправить',
          en: 'Submit'
        }
      }
    };

/*
    const relatedArticles = ref([
      {
        emoji: '🤖',
        tags: ['automation'],
        title: {
          ru: 'Основы автоматической торговли',
          en: 'Basics of Automated Trading'
        },
        date: {
          ru: '10 апреля 2023',
          en: 'April 10, 2023'
        },
        readTime: {
          ru: '4 мин чтения',
          en: '4 min read'
        },
        slug: 'automated-trading-basics'
      },
      {
        emoji: '⚡',
        tags: ['algorithms'],
        title: {
          ru: 'Улучшение алгоритмов исполнения ордеров',
          en: 'Improving Order Execution Algorithms'
        },
        date: {
          ru: '28 марта 2023',
          en: 'March 28, 2023'
        },
        readTime: {
          ru: '6 мин чтения',
          en: '6 min read'
        },
        slug: 'order-execution-algorithms'
      },
      {
        emoji: '📊',
        tags: ['trading', 'caseStudy'],
        title: {
          ru: 'Кейс: автоматизация торгового портфеля',
          en: 'Case Study: Trading Portfolio Automation'
        },
        date: {
          ru: '15 марта 2023',
          en: 'March 15, 2023'
        },
        readTime: {
          ru: '7 мин чтения',
          en: '7 min read'
        },
        slug: 'portfolio-automation-case'
      }
    ]);
*/
    return {
      currentLanguage,
      translations,
      loading,
      article,
      error,
      relatedArticles
    };
  }
}
</script>

<style>
.prose {
  color: inherit;
  max-width: 100%;
}

.prose h2 {
  color: inherit;
  margin-top: 2em;
  margin-bottom: 1em;
  font-size: 1.5em;
  font-weight: 600;
}

.prose p {
  margin-bottom: 1.5em;
  line-height: 1.6;
}

.prose ul {
  list-style-type: disc;
  padding-left: 1.5em;
  margin-bottom: 1.5em;
}

.prose li {
  margin-bottom: 0.5em;
}

.dark .prose {
  color: inherit;
}

.dark .prose h2 {
  color: inherit;
}
</style>