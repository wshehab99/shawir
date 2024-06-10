abstract class ApiConfig {
  static const String baseUrl = "http://shawir.app/api/v1";
  static const String authToken =
      "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjE1MDQxLCJhY2NvdW50SWQiOjE1MTc1LCJ0eXBlSWQiOjEsImlhdCI6MTcxNzQzMDI5MywiZXhwIjoxNzMxMjU0MjkzfQ.K5mvOz6hkf_WrJrKxmT4dx9mBwV77f6CtwXqdwj7-dpG2WxOypB7DaNYf5YBO_tJjjF6MBhd0P4ESYjJZeZAuPbwldou5ccIFKCxQTbUju5HZynM7ZbPCTLI7BfrigG90oDWvF__ku7niOUxyPT6lfpO21X0P-dIo6pEIqliXIROfLpS5K5Fg4XwAONZUb7Wo5Dm2caLuvf_1PXX2lS8EncxvP2zfP_qasC8pOrlWV5me9ASCnCti-VCNVeWm7ytDuq7Bc0IG9K_eZ96XvHBUldGJMa8FDl-VlvReEavAkxt5LlnGn9tMBdxIETuWf1CxC5D1GEXw4PsN-yHDogKTA";
  static const String categories = "/requestAccount/categories";
  static const String uploadDocuments = "/requestAccount/uploadDocuments";
  static const String avatar = "/requestAccount/avatar";
  static const String languages = "/requestAccount/expert/languages";
  static const String professions = "/requestAccount/expert/professions";
  static const String uploadVideo = "/requestAccount/uploadVideo";
  static String subCategory(int id) => "/requestAccount/subCategory/$id";
}
