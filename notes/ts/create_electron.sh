##############################################################
npm install express dotenv
npm i -D typescript @types/express @types/node concurrently nodemon
npx tsc --init

npx create-electron-app cea --template=webpack
yarn add --dev typescript ts-loader fork-ts-checker-webpack-plugin
yarn add react react-dom @types/react @types/react-dom

co tsconfig.json
co webpack.rules.js
echo "{
  test: /\.tsx?$/,
  exclude: /(node_modules|.webpack)/,
  loaders: [{
    loader: 'ts-loader',
    options: {
      transpileOnly: true
    }
  }]
}"
co webpack.plugins.js
echo "const ForkTsCheckerWebpackPlugin = require('fork-ts-checker-webpack-plugin');"

echo "module.exports = [
  new ForkTsCheckerWebpackPlugin({
    async: false
  })
];"

co webpack.renderer.config.js
echo "const plugins = require('./webpack.plugins');"
echo ",
  plugins: plugins
"
####################################################################
