import type { AppInfo } from '@/types/app'
export const APP_ID = `${process.env.NEXT_PUBLIC_APP_ID}`
export const API_KEY = `${process.env.NEXT_PUBLIC_APP_KEY}`
export const API_URL = `${process.env.NEXT_PUBLIC_API_URL}`
export const APP_INFO: AppInfo = {
  title: '允朵智慧 - 基础版',
  description: '允朵智慧是一个专为允朵文化传媒有限公司开发的一款轻量级 AI 产品。',
  copyright: 'MindReset',
  privacy_policy: '',
  default_language: 'zh-Hans',
}

export const isShowPrompt = true
export const promptTemplate = '你能做什么？'

export const API_PREFIX = '/api'

export const LOCALE_COOKIE_NAME = 'locale'

export const DEFAULT_VALUE_MAX_LEN = 48
