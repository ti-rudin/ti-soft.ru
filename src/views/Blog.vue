<template>
  <div class="max-w-6xl mx-auto p-6 bg-gray-50 dark:bg-gray-900 min-h-screen text-gray-700 dark:text-gray-300">
    <!-- Hero Section -->
    <section class="mb-16 text-center">
      <h1 class="text-4xl md:text-5xl font-bold mb-6 text-gray-900 dark:text-white animate-fade-in-down">
        {{ translations.title[currentLanguage] }}
      </h1>
      <p class="text-xl text-gray-600 dark:text-gray-300 max-w-3xl mx-auto">
        {{ translations.subtitle[currentLanguage] }}
      </p>
    </section>

    <!-- Featured Article -->
<section class="mb-16" v-if="featuredArticle">
  <div class="bg-white dark:bg-gray-800 rounded-xl overflow-hidden shadow-lg hover:shadow-xl transition-all">
    <div class="md:flex">
      <div class="md:w-1/3 bg-indigo-100 dark:bg-indigo-900 flex items-center justify-center p-8">
        <span class="text-6xl text-indigo-600 dark:text-indigo-300">📌</span>
      </div>
      <div class="md:w-2/3 p-8">
        <div class="flex flex-wrap gap-2 mb-4">
          <span 
            v-for="tag in featuredArticle.tags.slice(0, 2)" 
            :key="tag"
            class="px-3 py-1 bg-indigo-100 dark:bg-indigo-900 text-indigo-800 dark:text-indigo-200 rounded-full text-sm font-medium">
            {{ translations.tags[tag]?.[currentLanguage] || tag }}
          </span>
        </div>
        <h2 class="text-2xl font-bold mb-4 text-gray-900 dark:text-white">
          {{ featuredArticle.title[currentLanguage] }}
        </h2>
        <p class="text-gray-600 dark:text-gray-300 mb-4">
          {{ featuredArticle.excerpt[currentLanguage] }}
        </p>
        <div class="flex items-center text-sm text-gray-500 dark:text-gray-400 mb-4">
          <span class="mr-4">{{ featuredArticle.date[currentLanguage] }}</span>
          <span>{{ featuredArticle.readTime[currentLanguage] }}</span>
        </div>
        <router-link 
          :to="`/article/${featuredArticle.id}`" 
          class="inline-flex items-center text-indigo-600 dark:text-indigo-400 hover:text-indigo-800 dark:hover:text-indigo-300 font-medium">
          {{ translations.readMore[currentLanguage] }}
          <svg class="w-4 h-4 ml-1" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
            <path fill-rule="evenodd" d="M12.293 5.293a1 1 0 011.414 0l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414-1.414L14.586 11H3a1 1 0 110-2h11.586l-2.293-2.293a1 1 0 010-1.414z" clip-rule="evenodd"></path>
          </svg>
        </router-link>
      </div>
    </div>
  </div>
</section>

    <!-- Tags Cloud -->
    <section class="mb-16">
      <h2 class="text-2xl font-semibold mb-6 text-center text-gray-900 dark:text-white">
        {{ translations.tagsTitle[currentLanguage] }}
      </h2>
      <div class="flex flex-wrap justify-center gap-3">
        <button 
          v-for="tag in availableTags" 
          :key="tag"
          @click="toggleTag(tag)"
          class="px-4 py-2 rounded-full shadow-sm hover:shadow-md transition-all hover:-translate-y-0.5"
          :class="{
            'bg-indigo-600 text-white': selectedTags.includes(tag),
            'bg-gray-100 dark:bg-gray-700 text-gray-800 dark:text-gray-200': !selectedTags.includes(tag)
          }">
          {{ translations.tags[tag]?.[currentLanguage] || tag }}
        </button>
      </div>
    </section>

<!-- Articles Grid -->
<section class="mb-16">
  <h2 class="text-2xl font-semibold mb-8 text-center text-gray-900 dark:text-white">
    {{ translations.latestArticles[currentLanguage] }}
  </h2>
  <div class="grid md:grid-cols-2 lg:grid-cols-4 gap-8">
    <router-link 
      v-for="(article, index) in paginatedArticles" 
      :key="index"
      :to="`/article/${article.id}`"
      class="bg-white dark:bg-gray-800 rounded-xl overflow-hidden shadow-md hover:shadow-lg transition-all hover:-translate-y-1 block">
      <div class="h-48 bg-gray-200 dark:bg-gray-700 flex items-center justify-center">
        <span class="text-5xl">{{ article.emoji }}</span>
      </div>
      <div class="p-6">
        <div class="flex flex-wrap gap-2 mb-3">
          <span 
            v-for="(tag, tagIndex) in article.tags" 
            :key="tagIndex"
            class="px-2 py-1 bg-gray-100 dark:bg-gray-700 text-gray-800 dark:text-gray-200 rounded-full text-xs font-medium">
            {{ (translations.tags[tag] || {})[currentLanguage] || tag }}
          </span>
        </div>
        <h3 class="text-xl font-bold mb-2 text-gray-900 dark:text-white">
          {{ article.title[currentLanguage] }}
        </h3>
        <p class="text-gray-600 dark:text-gray-300 text-sm mb-4">
          {{ article.excerpt[currentLanguage] }}
        </p>
        <div class="flex items-center justify-between text-xs text-gray-500 dark:text-gray-400">
          <span>{{ article.date[currentLanguage] }}</span>
          <span>{{ article.readTime[currentLanguage] }}</span>
        </div>
      </div>
    </router-link>
  </div>
</section>

    <!-- Pagination -->
    <section class="flex justify-center">
      <nav class="flex items-center space-x-2">
        <button 
            @click="prevArticlePage"
            :disabled="currentArticlePage === 1"
            class="w-10 h-10 flex items-center justify-center rounded-full transition-colors"
            :class="{
              'bg-gray-200 dark:bg-gray-700 text-gray-700 dark:text-gray-300 hover:bg-indigo-600 hover:text-white': currentArticlePage > 1,
              'bg-gray-100 dark:bg-gray-800 text-gray-400 dark:text-gray-500 cursor-not-allowed': currentArticlePage === 1
            }">
            &laquo;
          </button>
          
          <button 
            v-for="page in totalArticlePages"
            :key="page"
            @click="currentArticlePage = page"
            class="w-10 h-10 flex items-center justify-center rounded-full transition-colors"
            :class="{
              'bg-indigo-600 text-white': page === currentArticlePage,
              'bg-white dark:bg-gray-800 text-gray-700 dark:text-gray-300 hover:bg-gray-100 dark:hover:bg-gray-700': page !== currentArticlePage
            }">
            {{ page }}
          </button>
          
          <button 
            @click="nextArticlePage"
            :disabled="currentArticlePage === totalArticlePages"
            class="w-10 h-10 flex items-center justify-center rounded-full transition-colors"
            :class="{
              'bg-gray-200 dark:bg-gray-700 text-gray-700 dark:text-gray-300 hover:bg-indigo-600 hover:text-white': currentArticlePage < totalArticlePages,
              'bg-gray-100 dark:bg-gray-800 text-gray-400 dark:text-gray-500 cursor-not-allowed': currentArticlePage === totalArticlePages
            }">
            &raquo;
          </button>
      </nav>
    </section>
  </div>
</template>

<script>
import { ref, computed, onMounted } from 'vue';
import { currentLanguage } from '../stores/language';

export default {
  name: 'BlogPage',
  setup() {
    const articlesPerPage = 4;
    const currentArticlePage = ref(1);
    const articles = ref([]);
    const loading = ref(false);
    const error = ref(null);
    const selectedTags = ref([]);

    const toggleTag = (tagKey) => {
      if (selectedTags.value.includes(tagKey)) {
        selectedTags.value = selectedTags.value.filter(t => t !== tagKey);
      } else {
        selectedTags.value = [...selectedTags.value, tagKey];
      }
      currentArticlePage.value = 1;
    };
    const availableTags = computed(() => {
      const allTags = articles.value.flatMap(article => article.tags || []);
      return [...new Set(allTags)]; 
    });
    
    const featuredArticle = computed(() => {
      const featured = articles.value.filter(article => 
        article.tags?.includes('featured') || article.tags?.includes('Рекомендуем')
      );

      return featured.sort((a, b) => 
        new Date(b.date.en) - new Date(a.date.en)
      )[0];
    });

    function truncateText(text, maxLength) {
      return text.length > maxLength ? text.substring(0, maxLength) + "..." : text;
    }

    function formatDate(dateString, locale) {
      const options = { year: 'numeric', month: 'long', day: 'numeric' };
      return new Date(dateString).toLocaleDateString(locale, options);
    }

    function calculateReadTime(text) {
      if (!text) return "1 min read";
      const words = text.split(/\s+/).length;
      const minutes = Math.ceil(words / 200);
      return `${minutes} min read`;
    }

    function calculateReadTimeRu(text) {
      if (!text) return "1 мин чтения";
      const words = text.split(/\s+/).length;
      const minutes = Math.ceil(words / 200);
      return `${minutes} мин чтения`;
    }

    async function loadArticlesFromGitHub() {
      loading.value = true;
      error.value = null;
      const url = `https://api.github.com/repos/ti-rudin/ti-robots.ru/issues`;

      try {
        const response = await fetch(url);
        if (!response.ok) throw new Error(`HTTP error! status: ${response.status}`);
        
        const issues = await response.json();
        
        articles.value = issues.map((issue) => ({
          id: issue.number,  // Добавляем ID статьи (issue number)
          emoji: "📄",
          tags: issue.labels?.map(label => label.name) || ["github"],
          title: {
            en: issue.title,
            ru: issue.title
          },
          excerpt: {
            en: issue.body ? truncateText(issue.body, 100) : "No description",
            ru: issue.body ? truncateText(issue.body, 100) : "Нет описания"
          },
          date: {
            en: formatDate(issue.created_at, 'en-US'),
            ru: formatDate(issue.created_at, 'ru-RU')
          },
          readTime: {
            en: calculateReadTime(issue.body),
            ru: calculateReadTimeRu(issue.body)
          }
        }));

      } catch (err) {
        console.error("Error loading articles:", err);
        error.value = err.message;
        articles.value = [];
      } finally {
        loading.value = false;
      }
    }

    onMounted(loadArticlesFromGitHub);
    

    const translations = {
      title: {
        ru: 'Блог',
        en: 'Blog'
      },
      subtitle: {
        ru: 'Полезные статьи и новости о наших продуктах и технологиях',
        en: 'Helpful articles and news about our products and technologies'
      },
      featuredTag: {
        ru: 'Рекомендуем',
        en: 'Featured'
      },
      featuredArticle: {
        title: {
          ru: 'Как автоматизация торговли может увеличить вашу прибыль',
          en: 'How trading automation can increase your profits'
        },
        excerpt: {
          ru: 'Подробный разбор методов автоматизации торговли и их влияния на доходность инвестиционного портфеля.',
          en: 'Detailed analysis of trading automation methods and their impact on investment portfolio returns.'
        },
        date: {
          ru: '15 мая 2023',
          en: 'May 15, 2023'
        },
        readTime: {
          ru: '5 мин чтения',
          en: '5 min read'
        }
      },
      tagsTitle: {
        ru: 'Облако тегов',
        en: 'Tags Cloud'
      },
      latestArticles: {
        ru: 'Последние статьи',
        en: 'Latest Articles'
      },
      readMore: {
        ru: 'Читать далее',
        en: 'Read more'
      },
      tags: {
        featured: {
          ru: 'Рекомендуем',
          en: 'Featured'
        },
        automation: {
          ru: 'Автоматизация',
          en: 'Automation'
        },
        trading: {
          ru: 'Трейдинг',
          en: 'Trading'
        },
        smartHome: {
          ru: 'Умный дом',
          en: 'Smart Home'
        },
        events: {
          ru: 'Мероприятия',
          en: 'Events'
        },
        openSource: {
          ru: 'Open Source',
          en: 'Open Source'
        },
        algorithms: {
          ru: 'Алгоритмы',
          en: 'Algorithms'
        },
        caseStudy: {
          ru: 'Кейсы',
          en: 'Case Studies'
        }
      }
    };

    const filteredArticles = computed(() => {
      if (selectedTags.value.length === 0) return articles.value;
      
      return articles.value.filter(article => 
        article.tags?.some(tag => selectedTags.value.includes(tag))
      );
    });

    const paginatedArticles = computed(() => {
      const start = (currentArticlePage.value - 1) * articlesPerPage;
      const end = start + articlesPerPage;
      return filteredArticles.value.slice(start, end);
    });

    const totalArticlePages = computed(() => {
      return Math.ceil(filteredArticles.value.length / articlesPerPage);
    });
    const nextArticlePage = () => {
      if (currentArticlePage.value < totalArticlePages.value) {
        currentArticlePage.value++;
      }
    };

    const prevArticlePage = () => {
      if (currentArticlePage.value > 1) {
        currentArticlePage.value--;
      }
    };

    return {
      currentLanguage,
      translations,
      articles,
      paginatedArticles,
      currentArticlePage,
      totalArticlePages,
      nextArticlePage,
      prevArticlePage,
      toggleTag,
      filteredArticles,
      loading,
      error,
      selectedTags,
      availableTags,
      featuredArticle
    };
  }
}
</script>

<style>
.animate-fade-in-down {
  animation: fadeInDown 0.6s ease-out;
}

@keyframes fadeInDown {
  from {
    opacity: 0;
    transform: translateY(-20px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}
</style>