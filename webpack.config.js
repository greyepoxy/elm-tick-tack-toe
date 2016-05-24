var merge = require( 'webpack-merge' );
var commonConfig = require('./webpack.common.config.js').commonConfig;
var indexFileConfig = require('./webpack.common.config.js').indexFileConfig;
var indexEntryConfig = require('./webpack.common.config.js').indexEntryConfig;

// detemine build env
var TARGET_ENV = process.env.npm_lifecycle_event === 'build' ? 'prod' : 'dev';

// additional webpack settings for local env (when invoked by 'npm run dev or npm run watch')
if ( TARGET_ENV === 'dev' ) {
  var devConfig = require('./webpack.common.config.js').devConfig;
  var elmHotLoaderConfig = require('./webpack.common.config.js').elmHotLoaderConfig;
  
	module.exports = merge(commonConfig, indexFileConfig, devConfig, elmHotLoaderConfig);
}

// additional webpack settings for prod env (when invoked via 'npm run build')
if ( TARGET_ENV === 'prod' ) {
  var elmConfig = require('./webpack.common.config.js').elmConfig;
	
	module.exports = merge(commonConfig, indexFileConfig, elmConfig, {
		
		//TODO: perform optimizations!
		//plugins: [
      // new webpack.optimize.OccurenceOrderPlugin(),

      // minify & mangle JS/CSS
      // new webpack.optimize.UglifyJsPlugin({
      //     minimize:   true,
      //     compressor: { warnings: false }
      //     // mangle:  true
      // })
    //]

  });
}
