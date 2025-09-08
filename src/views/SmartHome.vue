<template>
  <div class="max-w-6xl mx-auto p-6 bg-gray-50 dark:bg-gray-900 min-h-screen text-gray-700 dark:text-gray-300">
    <!-- Product Header -->
    <div class="mb-12 text-center">
      <div class="flex flex-wrap justify-center gap-2 mb-6">
        <span 
          v-for="(tag, index) in product.tags" 
          :key="index"
          class="px-3 py-1 rounded-full text-sm font-medium"
          :class="{
            'bg-purple-100 dark:bg-purple-900 text-purple-800 dark:text-purple-200': index === 0,
            'bg-gray-100 dark:bg-gray-700 text-gray-800 dark:text-gray-200': index !== 0
          }">
          {{ translations.tags[tag][currentLanguage] }}
        </span>
      </div>
      <h1 class="text-3xl md:text-4xl font-bold mb-4 text-gray-900 dark:text-white">
        {{ product.title[currentLanguage] }}
      </h1>
      <p class="text-xl text-gray-600 dark:text-gray-300 max-w-3xl mx-auto">
        {{ product.subtitle[currentLanguage] }}
      </p>
    </div>

    <!-- Product Image -->
    <div class="mb-12 h-96 bg-gray-200 dark:bg-gray-700 rounded-xl flex items-center justify-center">
      <span class="text-8xl">🏠</span>
    </div>

    <!-- Product Content -->
    <article class="prose dark:prose-invert max-w-3xl mx-auto mb-16">
      <h2>{{ translations.content.intro[currentLanguage] }}</h2>
      <p>{{ translations.content.introText[currentLanguage] }}</p>
      
      <h2>{{ translations.content.features[currentLanguage] }}</h2>
      <div class="grid md:grid-cols-3 gap-6 mb-8">
        <div 
          v-for="(feature, index) in translations.content.featureList[currentLanguage]" 
          :key="index"
          class="bg-white dark:bg-gray-800 p-4 rounded-lg shadow-sm">
          <div class="text-2xl mb-2">{{ feature.emoji }}</div>
          <h3 class="font-medium mb-1">{{ feature.title }}</h3>
          <p class="text-sm text-gray-600 dark:text-gray-300">{{ feature.description }}</p>
        </div>
      </div>

      <h2>{{ translations.content.solutions[currentLanguage] }}</h2>
      <div class="grid md:grid-cols-2 gap-6 mb-8">
        <div 
          v-for="(solution, index) in translations.content.solutionList[currentLanguage]" 
          :key="index"
          class="bg-white dark:bg-gray-800 p-4 rounded-lg shadow-sm">
          <h3 class="font-medium mb-2">{{ solution.title }}</h3>
          <ul class="space-y-2 text-sm">
            <li 
              v-for="(item, itemIndex) in solution.items" 
              :key="itemIndex"
              class="flex items-start">
              <svg class="h-4 w-4 text-green-500 mr-2 mt-0.5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7" />
              </svg>
              <span>{{ item }}</span>
            </li>
          </ul>
        </div>
      </div>

      <div class="bg-purple-50 dark:bg-purple-900 p-6 rounded-xl border border-purple-200 dark:border-purple-800">
        <h3 class="text-purple-800 dark:text-purple-200 mt-0">{{ translations.content.tip[currentLanguage] }}</h3>
        <p class="text-purple-700 dark:text-purple-300 mb-0">{{ translations.content.tipText[currentLanguage] }}</p>
      </div>
    </article>

    <!-- Package Info -->
    <div class="max-w-3xl mx-auto mb-16 p-6 bg-white dark:bg-gray-800 rounded-xl shadow-sm">
      <h2 class="text-xl font-semibold mb-4 text-gray-900 dark:text-white">
        {{ translations.package.title[currentLanguage] }}
      </h2>
      <p class="mb-4">{{ translations.package.description[currentLanguage] }}</p>
      <div class="grid md:grid-cols-3 gap-6">
        <div 
          v-for="(service, index) in translations.package.services[currentLanguage]" 
          :key="index"
          class="bg-white dark:bg-gray-700 p-4 rounded-lg">
          <h3 class="font-semibold mb-2">{{ service.title }}</h3>
          <ul class="space-y-2 text-sm mb-3">
            <li 
              v-for="(item, itemIndex) in service.items" 
              :key="itemIndex"
              class="flex items-start">
              <svg class="h-4 w-4 text-purple-500 mr-2 mt-0.5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7" />
              </svg>
              <span>{{ item }}</span>
            </li>
          </ul>
          <div class="text-purple-600 dark:text-purple-300 text-sm font-medium">
            {{ service.price }}
          </div>
        </div>
      </div>
    </div>

    <!-- Use Cases -->
    <section class="mb-16">
      <h2 class="text-2xl font-semibold mb-8 text-center text-gray-900 dark:text-white">
        {{ translations.useCases.title[currentLanguage] }}
      </h2>
      <div class="grid md:grid-cols-3 gap-8">
        <div 
          v-for="(item, index) in useCases" 
          :key="index"
          class="bg-white dark:bg-gray-800 rounded-xl overflow-hidden shadow-md hover:shadow-lg transition-all hover:-translate-y-1">
          <div class="h-40 bg-gray-200 dark:bg-gray-700 flex items-center justify-center">
            <span class="text-4xl">{{ item.emoji }}</span>
          </div>
          <div class="p-6">
            <h3 class="text-lg font-bold mb-2 text-gray-900 dark:text-white">
              {{ item.title[currentLanguage] }}
            </h3>
            <p class="text-gray-600 dark:text-gray-300 text-sm mb-4">
              {{ item.description[currentLanguage] }}
            </p>
            <ul class="text-sm space-y-2">
              <li 
                v-for="(feature, featureIndex) in item.features[currentLanguage]" 
                :key="featureIndex"
                class="flex items-start">
                <svg class="h-4 w-4 text-purple-500 mr-2 mt-0.5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7" />
                </svg>
                <span>{{ feature }}</span>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </section>

    <!-- Why Choose Us -->
    <section class="max-w-3xl mx-auto mb-16">
      <h2 class="text-2xl font-semibold mb-6 text-gray-900 dark:text-white">
        {{ translations.advantages.title[currentLanguage] }}
      </h2>
      
      <div class="space-y-6">
        <div 
          v-for="(item, index) in translations.advantages.items[currentLanguage]" 
          :key="index"
          class="bg-white dark:bg-gray-800 p-6 rounded-lg shadow-sm">
          <div class="flex items-start">
            <div class="w-10 h-10 rounded-full bg-purple-100 dark:bg-purple-900 flex items-center justify-center mr-4">
              <span class="text-lg">{{ item.emoji }}</span>
            </div>
            <div>
              <h4 class="font-medium text-gray-900 dark:text-white">{{ item.title }}</h4>
              <p class="text-gray-700 dark:text-gray-300">{{ item.description }}</p>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Contact Form -->
    <section class="max-w-3xl mx-auto">
      <div class="bg-white dark:bg-gray-800 p-6 rounded-lg shadow-sm">
        <h3 class="text-lg font-medium mb-4 text-gray-900 dark:text-white">
          {{ translations.contact.title[currentLanguage] }}
        </h3>
        <p class="mb-6">{{ translations.contact.description[currentLanguage] }}</p>
        
        <form @submit.prevent="submitForm" class="space-y-6">
          <div class="grid md:grid-cols-2 gap-6">
            <div>
              <label for="name" class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">
                {{ translations.form.nameLabel[currentLanguage] }}
              </label>
              <input 
                type="text" 
                id="name" 
                v-model="formData.name"
                :placeholder="translations.form.namePlaceholder[currentLanguage]"
                class="w-full px-4 py-3 border border-gray-300 rounded-lg shadow-sm focus:outline-none focus:ring-2 focus:ring-purple-500 focus:border-transparent dark:bg-gray-700 dark:border-gray-600 dark:text-white dark:placeholder-gray-400 transition-colors">
            </div>
            
            <div>
              <label for="contact" class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">
                {{ translations.form.contactLabel[currentLanguage] }} <span class="text-red-500">*</span>
              </label>
              <input 
                type="text" 
                id="contact" 
                v-model="formData.contact" 
                required
                :placeholder="translations.form.contactPlaceholder[currentLanguage]"
                class="w-full px-4 py-3 border border-gray-300 rounded-lg shadow-sm focus:outline-none focus:ring-2 focus:ring-purple-500 focus:border-transparent dark:bg-gray-700 dark:border-gray-600 dark:text-white dark:placeholder-gray-400 transition-colors">
            </div>
          </div>
          
          <div>
            <label for="description" class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">
              {{ translations.form.descriptionLabel[currentLanguage] }} <span class="text-red-500">*</span>
            </label>
            <textarea 
              id="description" 
              v-model="formData.description" 
              required 
              rows="5"
              :placeholder="translations.form.descriptionPlaceholder[currentLanguage]"
              class="w-full px-4 py-3 border border-gray-300 rounded-lg shadow-sm focus:outline-none focus:ring-2 focus:ring-purple-500 focus:border-transparent dark:bg-gray-700 dark:border-gray-600 dark:text-white dark:placeholder-gray-400 resize-y transition-colors"></textarea>
          </div>
          
          <div class="h-6 text-sm text-center">
            <p v-if="formStatus.loading" class="text-purple-600 dark:text-purple-400 animate-pulse">
              {{ translations.form.sending[currentLanguage] }}
            </p>
            <p v-if="formStatus.error" class="text-red-600 dark:text-red-400">{{ formStatus.error }}</p>
            <p v-if="formStatus.success" class="text-green-600 dark:text-green-400">{{ formStatus.success }}</p>
          </div>
          
          <button 
            type="submit" 
            :disabled="formStatus.loading || formStatus.success"
            class="w-full bg-purple-600 text-white rounded-lg px-6 py-3 font-semibold hover:bg-purple-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-purple-500 disabled:opacity-50 disabled:cursor-not-allowed transition-colors duration-200">
            {{ formStatus.loading 
              ? translations.form.sending[currentLanguage] 
              : (formStatus.success 
                ? translations.form.sent[currentLanguage] 
                : translations.form.submit[currentLanguage]) }}
          </button>
        </form>
      </div>
    </section>
  </div>
</template>

<script>
import { reactive, ref } from 'vue';
import { currentLanguage } from '../stores/language';

export default {
  name: 'SmartHomePage',
  setup() {
    const formData = reactive({
      name: '',
      contact: '',
      description: ''
    });

    const formStatus = reactive({
      loading: false,
      error: null,
      success: null,
    });

    const translations = {
      tags: {
        automation: {
          ru: 'Автоматизация',
          en: 'Automation'
        },
        security: {
          ru: 'Безопасность',
          en: 'Security'
        },
        energy: {
          ru: 'Энергосбережение',
          en: 'Energy Saving'
        },
        comfort: {
          ru: 'Комфорт',
          en: 'Comfort'
        }
      },
      content: {
        intro: {
          ru: 'О системе',
          en: 'About the System'
        },
        introText: {
          ru: 'Wiren Board - это российская система автоматизации для жилых и коммерческих помещений, сочетающая надежность промышленных решений с гибкостью открытой платформы. Наша команда реализует проекты "под ключ" - от проектирования до пусконаладки.',
          en: 'Wiren Board is a Russian automation system for residential and commercial premises that combines the reliability of industrial solutions with the flexibility of an open platform. Our team implements turnkey projects - from design to commissioning.'
        },
        features: {
          ru: 'Основные возможности',
          en: 'Key Features'
        },
        featureList: {
          ru: [
            {
              emoji: '🔌',
              title: 'Полный контроль',
              description: 'Управление светом, отоплением, безопасностью и мультимедиа'
            },
            {
              emoji: '📱',
              title: 'Удобство',
              description: 'Интеграция с мобильными приложениями и голосовыми помощниками'
            },
            {
              emoji: '💡',
              title: 'Энергоэффективность',
              description: 'Умные сценарии для экономии ресурсов'
            }
          ],
          en: [
            {
              emoji: '🔌',
              title: 'Full Control',
              description: 'Management of lighting, heating, security and multimedia'
            },
            {
              emoji: '📱',
              title: 'Convenience',
              description: 'Integration with mobile apps and voice assistants'
            },
            {
              emoji: '💡',
              title: 'Energy Efficiency',
              description: 'Smart scenarios for resource saving'
            }
          ]
        },
        solutions: {
          ru: 'Решения для разных объектов',
          en: 'Solutions for Different Facilities'
        },
        solutionList: {
          ru: [
            {
              title: '🏡 Для жилых помещений',
              items: [
                'Управление освещением (до 19 групп светильников)',
                'Автоматизация штор (до 14 моторизованных штор)',
                'Климат-контроль (5 зон теплого пола)',
                'Голосовое управление через Алису и Siri'
              ]
            },
            {
              title: '🏢 Для коммерческих объектов',
              items: [
                'Диспетчеризация многоквартирных домов',
                'Мониторинг серверного оборудования',
                'Промышленная автоматизация',
                'Автоматизация сельского хозяйства'
              ]
            }
          ],
          en: [
            {
              title: '🏡 For Residential',
              items: [
                'Lighting control (up to 19 lighting groups)',
                'Blinds automation (up to 14 motorized blinds)',
                'Climate control (5 underfloor heating zones)',
                'Voice control via Alice and Siri'
              ]
            },
            {
              title: '🏢 For Commercial',
              items: [
                'Apartment building dispatching',
                'Server equipment monitoring',
                'Industrial automation',
                'Agricultural automation'
              ]
            }
          ]
        },
        tip: {
          ru: 'Решение "под ключ"',
          en: 'Turnkey Solution'
        },
        tipText: {
          ru: 'Мы предлагаем полную реализацию проекта вашего умного дома, включая проектирование, монтаж и программирование системы.',
          en: 'We offer a complete implementation of your smart home project, including design, installation and system programming.'
        }
      },
      package: {
        title: {
          ru: 'Наши услуги',
          en: 'Our Services'
        },
        description: {
          ru: 'Комплексные решения для автоматизации вашего дома:',
          en: 'Comprehensive solutions for your home automation:'
        },
        services: {
          ru: [
            {
              title: 'Проектирование',
              items: [
                'Разработка технического задания',
                'Создание схем электрощитов',
                'Подбор оборудования'
              ],
              price: 'От 50 000 ₽ для квартир'
            },
            {
              title: 'Монтажные работы',
              items: [
                'Прокладка кабельных трасс',
                'Сборка электрощитов',
                'Установка оборудования'
              ],
              price: 'От 200 000 ₽ для квартир'
            },
            {
              title: 'Программирование',
              items: [
                'Настройка контроллера',
                'Создание сценариев',
                'Интеграция с голосовыми помощниками'
              ],
              price: 'От 60 000 ₽'
            }
          ],
          en: [
            {
              title: 'Design',
              items: [
                'Technical specification development',
                'Electrical panel diagrams',
                'Equipment selection'
              ],
              price: 'From 50 000 ₽ for apartments'
            },
            {
              title: 'Installation',
              items: [
                'Cable routing',
                'Electrical panel assembly',
                'Equipment installation'
              ],
              price: 'From 200 000 ₽ for apartments'
            },
            {
              title: 'Programming',
              items: [
                'Controller configuration',
                'Scenario creation',
                'Voice assistant integration'
              ],
              price: 'From 60 000 ₽'
            }
          ]
        }
      },
      useCases: {
        title: {
          ru: 'Примеры реализаций',
          en: 'Implementation Examples'
        }
      },
      advantages: {
        title: {
          ru: 'Почему выбирают нас',
          en: 'Why Choose Us'
        },
        items: {
          ru: [
            {
              emoji: '🔧',
              title: 'Комплексный подход',
              description: 'Выполняем все работы от проектирования до пусконаладки, включая строительные и электромонтажные работы.'
            },
            {
              emoji: '🛡️',
              title: 'Гарантия 2 года',
              description: 'На все оборудование предоставляем гарантию 24 месяца с возможностью замены без отправки в сервисный центр.'
            },
            {
              emoji: '💻',
              title: 'Открытая платформа',
              description: 'Используем Wiren Board на базе Debian Linux, что позволяет легко расширять функционал и интегрировать новое оборудование.'
            },
            {
              emoji: '📞',
              title: 'Техническая поддержка',
              description: 'Круглосуточная поддержка по телефону и онлайн, включая срочный выезд инженера при необходимости.'
            }
          ],
          en: [
            {
              emoji: '🔧',
              title: 'Comprehensive Approach',
              description: 'We perform all work from design to commissioning, including construction and electrical work.'
            },
            {
              emoji: '🛡️',
              title: '2-Year Warranty',
              description: 'We provide a 24-month warranty on all equipment with the possibility of replacement without sending to a service center.'
            },
            {
              emoji: '💻',
              title: 'Open Platform',
              description: 'We use Wiren Board based on Debian Linux, which allows easy expansion of functionality and integration of new equipment.'
            },
            {
              emoji: '📞',
              title: 'Technical Support',
              description: '24/7 support by phone and online, including emergency engineer visits if necessary.'
            }
          ]
        }
      },
      contact: {
        title: {
          ru: 'Готовы сделать ваш дом умным?',
          en: 'Ready to Make Your Home Smart?'
        },
        description: {
          ru: 'Оставьте заявку и наш специалист свяжется с вами для бесплатной консультации',
          en: 'Leave a request and our specialist will contact you for a free consultation'
        }
      },
      form: {
        nameLabel: {
          ru: 'Ваше имя',
          en: 'Your Name'
        },
        namePlaceholder: {
          ru: 'Как к вам обращаться? (необязательно)',
          en: 'How should we address you? (optional)'
        },
        contactLabel: {
          ru: 'Контактные данные',
          en: 'Contact Details'
        },
        contactPlaceholder: {
          ru: 'Телефон или email (обязательно)',
          en: 'Phone or email (required)'
        },
        descriptionLabel: {
          ru: 'Опишите вашу задачу',
          en: 'Describe your task'
        },
        descriptionPlaceholder: {
          ru: 'Расскажите, что вы хотите автоматизировать',
          en: 'Tell us what you want to automate'
        },
        sending: {
          ru: 'Отправка...',
          en: 'Sending...'
        },
        sent: {
          ru: 'Отправлено!',
          en: 'Sent!'
        },
        submit: {
          ru: 'Отправить заявку',
          en: 'Submit Request'
        },
        errorRequired: {
          ru: 'Пожалуйста, укажите контактные данные и описание задачи',
          en: 'Please provide contact details and task description'
        },
        errorSend: {
          ru: 'Ошибка отправки. Попробуйте снова или свяжитесь с нами другим способом',
          en: 'Sending error. Please try again or contact us by other means'
        },
        errorNetwork: {
          ru: 'Сетевая ошибка. Проверьте подключение и попробуйте снова',
          en: 'Network error. Check your connection and try again'
        },
        successMessage: {
          ru: 'Спасибо! Мы свяжемся с Вами в ближайшее время',
          en: 'Thank you! We will contact you shortly'
        }
      }
    };

    const product = ref({
      emoji: '🏠',
      tags: ['automation', 'security', 'energy', 'comfort'],
      title: {
        ru: 'Умный дом на базе WirenBoard',
        en: 'Smart Home Based on WirenBoard'
      },
      subtitle: {
        ru: 'Современное решение для автоматизации жилых и коммерческих помещений',
        en: 'Modern solution for automation of residential and commercial premises'
      }
    });

    const useCases = ref([
      {
        emoji: '🏡',
        title: {
          ru: 'Модульный умный дом',
          en: 'Modular Smart Home'
        },
        description: {
          ru: 'Дом площадью 75 м² из пяти блок-модулей с полной автоматизацией',
          en: '75 m² house made of five block modules with full automation'
        },
        features: {
          ru: [
            '17 групп светильников и 5 диммируемых зон',
            '7 приводов штор с управлением через Zigbee',
            '5 зон водяного теплого пола'
          ],
          en: [
            '17 lighting groups and 5 dimmable zones',
            '7 curtain actuators with Zigbee control',
            '5 zones of water underfloor heating'
          ]
        }
      },
      {
        emoji: '🏢',
        title: {
          ru: 'Квартира в ЖК "Охта Парк"',
          en: 'Apartment in "Okhta Park"'
        },
        description: {
          ru: 'Полная автоматизация квартиры 130 м² в Санкт-Петербурге',
          en: 'Full automation of a 130 m² apartment in St. Petersburg'
        },
        features: {
          ru: [
            '75 светильников с управлением по DALI',
            '14 моторизованных штор',
            '12 датчиков 5-в-1'
          ],
          en: [
            '75 luminaires with DALI control',
            '14 motorized blinds',
            '12 5-in-1 sensors'
          ]
        }
      },
      {
        emoji: '🌿',
        title: {
          ru: 'Особняк с умной баней',
          en: 'Mansion with Smart Sauna'
        },
        description: {
          ru: 'Комплексная автоматизация частного дома с сауной',
          en: 'Comprehensive automation of a private house with a sauna'
        },
        features: {
          ru: [
            '7 зон увлажнения с индивидуальным контролем',
            'Автоматизированная сауна',
            '16 кВт·ч резервного питания'
          ],
          en: [
            '7 humidification zones with individual control',
            'Automated sauna',
            '16 kWh backup power'
          ]
        }
      }
    ]);

    const submitForm = async () => {
      formStatus.loading = true;
      formStatus.error = null;
      formStatus.success = null;

      if (!formData.contact || !formData.contact.trim() || !formData.description || !formData.description.trim()) {
        formStatus.error = translations.form.errorRequired[currentLanguage.value];
        formStatus.loading = false;
        return;
      }

      const params = new URLSearchParams({
        name: formData.name.trim(),
        tel: formData.contact.trim(),
        description: formData.description.trim()
      });

      try {
        const res = await fetch(
          `https://ti-robots.netlify.app/zayavka/?${params.toString()}`,
          {
            method: "GET",
            headers: { Accept: "application/json" },
          }
        );

        if (res.ok) {
          formStatus.success = translations.form.successMessage[currentLanguage.value];
          formData.name = '';
          formData.contact = '';
          formData.description = '';
          setTimeout(() => {
            if (formStatus.success) {
              formStatus.success = null;
            }
          }, 3000);
        } else {
          const errorText = await res.text();
          console.error("Form submission error:", res.status, errorText);
          formStatus.error = `${translations.form.errorSend[currentLanguage.value]} (${res.status})`;
        }
      } catch (error) {
        console.error("Network error during form submission:", error);
        formStatus.error = translations.form.errorNetwork[currentLanguage.value];
      } finally {
        formStatus.loading = false;
      }
    };

    return {
      currentLanguage,
      translations,
      product,
      useCases,
      formData,
      formStatus,
      submitForm
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

.animate-pulse {
  animation: pulse 2s infinite;
}

@keyframes pulse {
  0% {
    opacity: 1;
  }
  50% {
    opacity: 0.7;
  }
  100% {
    opacity: 1;
  }
}
</style>