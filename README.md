# elm-tick-tack-toe
An elm project to write tick-tack-toe. Note: this is a work in progress!

## Development Commands
###Build a distributable version:
`npm run build` or `npm run watch` files output to `dist/`.

###During development:
`npm run dev` and navigate to `http://localhost:3000/`.
On save, swap signal should be sent to elm StartApp which should trigger a re-render.

###To run unit tests:
`npm run test` and navigate to `http://localhost:3001/`.
On save, webpack will auto rebuild and any browser windows will auto reload.
