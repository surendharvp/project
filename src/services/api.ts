import axios, { AxiosError, AxiosResponse } from 'axios';
import { store } from '../redux/store';
import { clearUser } from '../redux/slices/userSlice';

const API_URL = import.meta.env.VITE_API_URL || 'http://localhost:8080/api';

const api = axios.create({
  baseURL: API_URL,
  headers: {
    'Content-Type': 'application/json',
  },
  timeout: 10000, // 10 second timeout
});

// Request interceptor
api.interceptors.request.use(
  (config) => {
    const token = localStorage.getItem('token');
    if (token) {
      config.headers.Authorization = `Bearer ${token}`;
    }
    return config;
  },
  (error) => {
    return Promise.reject(error);
  }
);

// Response interceptor
api.interceptors.response.use(
  (response: AxiosResponse) => response,
  async (error: AxiosError) => {
    const originalRequest = error.config;
    
    // Handle token expiration
    if (error.response?.status === 401 && originalRequest) {
      localStorage.removeItem('token');
      store.dispatch(clearUser());
      window.location.href = '/login';
      return Promise.reject(error);
    }

    // Handle server errors
    if (error.response?.status === 500) {
      console.error('Server error:', error);
    }

    // Handle network errors
    if (!error.response) {
      console.error('Network error:', error);
    }

    return Promise.reject(error);
  }
);

export default api;