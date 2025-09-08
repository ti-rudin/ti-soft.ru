<template>
  <div class="max-w-6xl mx-auto p-6 bg-gray-50 dark:bg-gray-900 min-h-screen text-gray-700 dark:text-gray-300">
    <!-- Hero Section -->
    <section class="mb-12 text-center">
      <h1 class="text-4xl font-bold mb-4 text-gray-900 dark:text-white animate-fade-in-down">
        {{ translations.title[currentLanguage] }}
      </h1>
      <p class="text-xl text-gray-600 dark:text-gray-300 max-w-3xl mx-auto">
        {{ translations.intro[currentLanguage] }}
      </p>
    </section>

    <!-- Contact Content -->
    <div class="flex flex-col lg:flex-row gap-8">
      <!-- Form Section -->
      <div class="lg:w-2/3">
        <div class="bg-white dark:bg-gray-800 rounded-xl p-8 shadow-lg">
          <h2 class="text-2xl font-semibold mb-6 text-indigo-600 dark:text-indigo-400">
            {{ translations.formTitle[currentLanguage] }}
          </h2>
          
          <form @submit.prevent="submitForm" class="space-y-6">
            <div>
              <label for="name" class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">
                {{ translations.nameLabel[currentLanguage] }}
              </label>
              <input type="text" id="name" v-model="formData.name" 
                :placeholder="translations.namePlaceholder[currentLanguage]"
                class="w-full px-4 py-3 border border-gray-300 rounded-lg shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-transparent dark:bg-gray-700 dark:border-gray-600 dark:text-white dark:placeholder-gray-400 transition-colors">
            </div>
            
            <div>
              <label for="contact" class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">
                {{ translations.contactLabel[currentLanguage] }} <span class="text-red-500">*</span>
              </label>
              <input type="text" id="contact" v-model="formData.contact" required
                :placeholder="translations.contactPlaceholder[currentLanguage]"
                class="w-full px-4 py-3 border border-gray-300 rounded-lg shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-transparent dark:bg-gray-700 dark:border-gray-600 dark:text-white dark:placeholder-gray-400 transition-colors">
            </div>
            
            <div>
              <label for="description" class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">
                {{ translations.descriptionLabel[currentLanguage] }} <span class="text-red-500">*</span>
              </label>
              <textarea id="description" v-model="formData.description" required rows="5"
                :placeholder="translations.descriptionPlaceholder[currentLanguage]"
                class="w-full px-4 py-3 border border-gray-300 rounded-lg shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-transparent dark:bg-gray-700 dark:border-gray-600 dark:text-white dark:placeholder-gray-400 resize-y transition-colors"></textarea>
            </div>
            
            <div class="h-6 text-sm text-center">
              <p v-if="formStatus.loading" class="text-indigo-600 dark:text-indigo-400 animate-pulse">
                {{ translations.sending[currentLanguage] }}
              </p>
              <p v-if="formStatus.error" class="text-red-600 dark:text-red-400">{{ formStatus.error }}</p>
              <p v-if="formStatus.success" class="text-green-600 dark:text-green-400">{{ formStatus.success }}</p>
            </div>
            
            <button type="submit" :disabled="formStatus.loading || formStatus.success"
              class="w-full bg-indigo-600 text-white rounded-lg px-6 py-3 font-semibold hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 disabled:opacity-50 disabled:cursor-not-allowed transition-colors duration-200">
              {{ formStatus.loading 
                ? translations.sending[currentLanguage] 
                : (formStatus.success 
                  ? translations.sent[currentLanguage] 
                  : translations.submit[currentLanguage]) }}
            </button>
          </form>
        </div>
      </div>

      <!-- Info Section -->
      <div class="lg:w-1/3 space-y-6">
        <div class="bg-white dark:bg-gray-800 rounded-xl p-6 shadow-lg">
          <h3 class="text-xl font-semibold mb-4 text-gray-900 dark:text-white">
            {{ translations.telegramTitle[currentLanguage] }}
          </h3>
          <p class="text-gray-600 dark:text-gray-300 mb-4">
            {{ translations.spamNotice[currentLanguage] }}
          </p>
          <a href="https://t.me/ti_robots_lab" target="_blank"
            class="inline-flex items-center px-4 py-2 bg-blue-500 text-white rounded-lg hover:bg-blue-600 transition-colors">
            <svg class="w-5 h-5 mr-2" fill="currentColor" viewBox="0 0 24 24">
              <path d="M12 0C5.373 0 0 5.373 0 12s5.373 12 12 12 12-5.373 12-12S18.627 0 12 0zm5.894 8.221-1.97 9.28c-.145.658-.537.818-1.084.508l-3-2.21-1.446 1.394c-.14.14-.26.26-.534.26l.192-3.19 5.542-5.04c.24-.213-.054-.334-.373-.12l-6.87 4.33-2.96-.92c-.64-.203-.658-.64.135-.954l11.57-4.46c.538-.196 1.006.128.832.94z"/>
            </svg>
            {{ translations.joinTelegram[currentLanguage] }}
          </a>
        </div>

        <div class="bg-gradient-to-r from-indigo-50 to-blue-50 dark:from-gray-800 dark:to-gray-700 rounded-xl p-6 shadow-lg">
          <h3 class="text-xl font-semibold mb-4 text-gray-900 dark:text-white">
            {{ translations.supportTitle[currentLanguage] }}
          </h3>
          <p class="text-gray-600 dark:text-gray-300 mb-4">
            {{ translations.supportText[currentLanguage] }}
          </p>
          <ul class="space-y-3 text-gray-700 dark:text-gray-300">
            <li class="flex items-start">
              <svg class="flex-shrink-0 w-5 h-5 mt-0.5 mr-2 text-indigo-600 dark:text-indigo-400" fill="currentColor" viewBox="0 0 20 20">
                <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"/>
              </svg>
              {{ translations.supportPoint1[currentLanguage] }}
            </li>
            <li class="flex items-start">
              <svg class="flex-shrink-0 w-5 h-5 mt-0.5 mr-2 text-indigo-600 dark:text-indigo-400" fill="currentColor" viewBox="0 0 20 20">
                <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"/>
              </svg>
              {{ translations.supportPoint2[currentLanguage] }}
            </li>
            <li class="flex items-start">
              <svg class="flex-shrink-0 w-5 h-5 mt-0.5 mr-2 text-indigo-600 dark:text-indigo-400" fill="currentColor" viewBox="0 0 20 20">
                <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"/>
              </svg>
              {{ translations.supportPoint3[currentLanguage] }}
            </li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { reactive } from 'vue';
import { currentLanguage } from '../stores/language';

export default {
  name: 'Contacts',
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
      title: {
        ru: 'Свяжитесь с нами',
        en: 'Contact Us',
      },
      intro: {
        ru: 'Хотите узнать, какие процессы можно автоматизировать в вашей компании?',
        en: 'Want to know which processes can be automated in your company?',
      },
      formTitle: {
        ru: 'Форма обратной связи',
        en: 'Contact Form',
      },
      nameLabel: {
        ru: 'Ваше имя',
        en: 'Your Name',
      },
      namePlaceholder: {
        ru: 'Как к вам обращаться? (необязательно)',
        en: 'How should we address you? (optional)',
      },
      contactLabel: {
        ru: 'Контактные данные',
        en: 'Contact Details',
      },
      contactPlaceholder: {
        ru: 'Телефон или email (обязательно)',
        en: 'Phone or email (required)',
      },
      descriptionLabel: {
        ru: 'Опишите вашу задачу',
        en: 'Describe your task',
      },
      descriptionPlaceholder: {
        ru: 'Расскажите, что вы хотите автоматизировать',
        en: 'Tell us what you want to automate',
      },
      sending: {
        ru: 'Отправка...',
        en: 'Sending...',
      },
      sent: {
        ru: 'Отправлено!',
        en: 'Sent!',
      },
      submit: {
        ru: 'Отправить заявку',
        en: 'Submit Request',
      },
      telegramTitle: {
        ru: 'Telegram чат',
        en: 'Telegram Chat',
      },
      spamNotice: {
        ru: 'Мы не оставляем номера телефонов из-за спама. Присоединяйтесь к нашему чату в Telegram для быстрых ответов:',
        en: 'We do not leave phone numbers due to spam. Join our Telegram chat for quick answers:',
      },
      joinTelegram: {
        ru: 'Присоединиться',
        en: 'Join Now',
      },
      supportTitle: {
        ru: 'Наша поддержка',
        en: 'Our Support',
      },
      supportText: {
        ru: 'Мы гарантируем:',
        en: 'We guarantee:',
      },
      supportPoint1: {
        ru: 'Ответ в течение 24 часов',
        en: 'Response within 24 hours',
      },
      supportPoint2: {
        ru: 'Профессиональную консультацию',
        en: 'Professional consultation',
      },
      supportPoint3: {
        ru: 'Индивидуальный подход к каждому проекту',
        en: 'Individual approach to each project',
      },
      errorRequired: {
        ru: 'Пожалуйста, укажите контактные данные и описание задачи',
        en: 'Please provide contact details and task description',
      },
      errorSend: {
        ru: 'Ошибка отправки. Попробуйте снова или свяжитесь с нами другим способом',
        en: 'Sending error. Please try again or contact us by other means',
      },
      errorNetwork: {
        ru: 'Сетевая ошибка. Проверьте подключение и попробуйте снова',
        en: 'Network error. Check your connection and try again',
      },
      successMessage: {
        ru: 'Спасибо! Мы свяжемся с Вами в ближайшее время',
        en: 'Thank you! We will contact you shortly',
      },
    };

    const submitForm = async () => {
      formStatus.loading = true;
      formStatus.error = null;
      formStatus.success = null;

      if (!formData.contact || !formData.contact.trim() || !formData.description || !formData.description.trim()) {
        formStatus.error = translations.errorRequired[currentLanguage.value];
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
          formStatus.success = translations.successMessage[currentLanguage.value];
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
          formStatus.error = `${translations.errorSend[currentLanguage.value]} (${res.status})`;
        }
      } catch (error) {
        console.error("Network error during form submission:", error);
        formStatus.error = translations.errorNetwork[currentLanguage.value];
      } finally {
        formStatus.loading = false;
      }
    };

    return {
      formData,
      formStatus,
      submitForm,
      currentLanguage,
      translations,
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