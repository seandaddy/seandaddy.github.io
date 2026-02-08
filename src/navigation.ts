import { getPermalink, getBlogPermalink, getAsset } from './utils/permalinks';

export const headerData = {
  links: [
    {
      text: 'Home',
      href: getPermalink('/'),
    },
    {
      text: 'About',
      href: getPermalink('/about'),
    },
    {
      text: 'Blog',
      links: [
        {
          text: 'All Posts',
          href: getBlogPermalink(),
        },
        {
          text: 'Categories',
          href: getPermalink('economics', 'category'),
        },
        {
          text: 'Tags',
          href: getPermalink('trade', 'tag'),
        },
      ],
    },
  ],
  actions: [],
};

export const footerData = {
  links: [],
  secondaryLinks: [],
  socialLinks: [
    { ariaLabel: 'X', icon: 'tabler:brand-x', href: 'https://twitter.com/BloomUDrOh' },
    { ariaLabel: 'Facebook', icon: 'tabler:brand-facebook', href: 'https://facebook.com/sangyong.oh' },
    { ariaLabel: 'Github', icon: 'tabler:brand-github', href: 'https://github.com/seandaddy' },
    { ariaLabel: 'RSS', icon: 'tabler:rss', href: getAsset('/rss.xml') },
    { ariaLabel: 'Email', icon: 'tabler:mail', href: 'mailto:seandaddy@gmail.com' },
  ],
  footNote: `
    © ${new Date().getFullYear()} Sang-Yong Oh · All rights reserved.
  `,
};
