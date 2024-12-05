export const API_ENDPOINTS = {
  AUTH: {
    LOGIN: '/auth/login',
    REGISTER: '/auth/register',
    LOGOUT: '/auth/logout',
  },
  USERS: {
    PROFILE: '/users/profile',
    TRANSACTIONS: '/users/transactions',
  },
  REQUESTS: {
    BASE: '/requests',
    DETAIL: (id: string) => `/requests/${id}`,
    BIDS: (id: string) => `/requests/${id}/bids`,
  },
} as const;

export const ROUTES = {
  HOME: '/',
  LOGIN: '/login',
  REGISTER: '/signup',
  DASHBOARD: '/dashboard',
  PROFILE: '/profile',
  REQUESTS: '/requests',
  REQUEST_DETAIL: (id: string) => `/requests/${id}`,
} as const;

export const STATUS_CODES = {
  OK: 200,
  CREATED: 201,
  BAD_REQUEST: 400,
  UNAUTHORIZED: 401,
  FORBIDDEN: 403,
  NOT_FOUND: 404,
  SERVER_ERROR: 500,
} as const;