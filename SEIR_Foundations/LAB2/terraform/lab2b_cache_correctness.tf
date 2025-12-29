# Explanation: Static files are the easy win—Chewbacca caches them like hyperfuel for speed.
resource "aws_cloudfront_cache_policy" "chewbacca_cache_static01" {
  name        = "${var.project_name}-cache-static01"
  comment     = "Aggressive caching for /static/*"
  default_ttl = 86400        # 1 day
  max_ttl     = 31536000     # 1 year
  min_ttl     = 0

  parameters_in_cache_key_and_forwarded_to_origin {
    # Explanation: Static should not vary on cookies—Chewbacca refuses to cache 10,000 versions of a PNG.
    cookies_config { cookie_behavior = "none" }

    # Explanation: Static should not vary on query strings (unless you do versioning); students can change later.
    query_strings_config { query_string_behavior = "none" }

    # Explanation: Keep headers out of cache key to maximize hit ratio.
    headers_config { header_behavior = "none" }

    enable_accept_encoding_gzip   = true
    enable_accept_encoding_brotli = true
  }
}
