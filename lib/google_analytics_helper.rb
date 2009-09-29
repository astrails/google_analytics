module GoogleAnalyticsHelper
  def google_analytics
    return unless code = GlobalPreference.get(:google_analytics_code)
    <<-HTML
<script type="text/javascript">
var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
</script>
<script type="text/javascript">
try {
var pageTracker = _gat._getTracker("#{code}");
pageTracker._trackPageview();
} catch(err) {}</script>
    HTML
  end
end
