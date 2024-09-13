This is a [Next.js](https://nextjs.org/) project bootstrapped with [`create-next-app`](https://github.com/vercel/next.js/tree/canary/packages/create-next-app).

## Set Up

## Extensions:

ES7 + React + Redux
JavaScript and TypeScript Nightly
Tailwind CSS IntelliSense

## Get Next JS

`npx create-next-app@13.4`

## Getting Started

First, run the development server:

```bash
npm run dev
# or
yarn dev
# or
pnpm dev
```

Open [http://localhost:3000](http://localhost:3000) with your browser to see the result.

You can start editing the page by modifying `app/page.tsx`. The page auto-updates as you edit the file.

This project uses [`next/font`](https://nextjs.org/docs/basic-features/font-optimization) to automatically optimize and load Inter, a custom Google Font.

## Routing

NextJs route is by convention. It has client side navigation.

## Rendering Environments

### Client side rendering

Large bundles
Resource heavy
No SEO

### Server side rendering

Smaller bundles
Resource efficient
SEO
More secure
Loose Browser access , Use effects

Default to server components -> then use client side.

Smaller components into client side.

`use client` directive to mark the component to render in client side.

## Fetch Data

### Accessing data from browser

useState() + userEffect()
React Query

https://jsonplaceholder.typicode.com/users

has disadvantages. NOT SEO friendly, Another round trip to get data.

### Server Data access

This is done by using `fetch` . This is secure and SEO friendly.
It has own data cache.

## Server side rendering modes

### Static Rendering

Compile time rendering, by default caching is enabled with fetch. if cache enabled
Next JS treat a component as static rendering.

### Dynamic Rendering

Rendering happens at request time

## Styling NextJS

### global.css

Global for whole site

### CSS modules

for component styling.
`ProductCard.module.css` import this into the components
as javascript object and use it in styles.

### Tailwind

p-5 my-5 bg-sky-400 text-white text-xl hover:bg-sky-600

It is simple to use and like inline.

### DaisyUI

https://daisyui.com/docs/themes/
Components like Bootstrap
