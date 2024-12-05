import { AxiosError } from 'axios';
import { toast } from 'react-toastify';

export class AppError extends Error {
  constructor(
    message: string,
    public code?: string,
    public status?: number
  ) {
    super(message);
    this.name = 'AppError';
  }
}

export const handleApiError = (error: unknown): AppError => {
  if (error instanceof AxiosError) {
    const message = error.response?.data?.message || error.message;
    const status = error.response?.status;
    const code = error.response?.data?.code;
    
    // Log error for monitoring
    console.error(`API Error: ${status} - ${message}`, error);
    
    return new AppError(message, code, status);
  }
  
  if (error instanceof Error) {
    return new AppError(error.message);
  }
  
  return new AppError('An unexpected error occurred');
};

export const showErrorToast = (error: AppError) => {
  toast.error(error.message, {
    position: 'top-right',
    autoClose: 5000,
    hideProgressBar: false,
    closeOnClick: true,
    pauseOnHover: true,
    draggable: true,
  });
};