import "./globals.css";
import type {Metadata} from "next";
import {Inter} from "next/font/google";

const inter = Inter({subsets: ["latin"]});

export const metadata: Metadata = {
  title: "Book Reviews",
  description: "Book reviews",
};

export default function RootLayout({children}: {children: React.ReactNode}) {
  return (
    <html data-theme="dark" lang="en">
      <body className={inter.className}>{children}</body>
    </html>
  );
}
