import { jwtDecode } from 'jwt-decode';

interface DecodedToken {
  sub: string;
  exp: number;
}

export const isTokenValid = (token: string): boolean => {
  try {
    const decoded = jwtDecode<DecodedToken>(token);
    const currentTime = Date.now() / 1000;
    
    return decoded.exp > currentTime;
  } catch {
    return false;
  }
};

export const sanitizeInput = (input: string): string => {
  return input
    .replace(/[<>]/g, '') // Remove potential HTML tags
    .trim();
};

export const generateNonce = (): string => {
  return Math.random().toString(36).substring(2, 15);
};