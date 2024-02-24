//theme.ts
import { extendTheme } from "@chakra-ui/react";

export const theme = extendTheme({
  colors: {
    transparent: 'transparent',
    black: '#615855',
    gray: '#8F827D',
    white: '#F3A68E',
  },
  styles: {
    global: {
      body: {
        backgroundColor: 'black',
        color: 'white',
        fontFamily: 'Source Code Pro',
        padding: '0.5rem',
        paddingRight: '1rem',
      },
      html: {
        height: '100%',
      }
    }
  }
})
