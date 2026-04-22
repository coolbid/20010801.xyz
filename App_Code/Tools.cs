using System;
using System.Text;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text.RegularExpressions;
using System.Management;

namespace basic.Tools
{
    /// <summary>
    /// QZRequest 的摘要说明
    /// </summary>
    public class RequestClass
    {
        /// <summary>
        /// 获得指定Url参数的值
        /// </summary>
        /// <param name="strName">Url参数</param>
        /// <returns>Url参数的值</returns>
        public static string GetQueryString(string strName)
        {
            return GetString(strName);
        }
        /// <summary>
        /// 获得指定Url参数的值 转换为int
        /// </summary>
        /// <param name="strName">参数</param>
        /// <param name="intDefault">默认值</param>
        public static int GetQueryInt(string strName, int intDefault)
        {
            int Int = intDefault;
            if (HttpContext.Current.Request.QueryString[strName] == null)
            {
                Int = intDefault;
            }
            else
            {
                try
                {
                    Int = Int32.Parse(HttpContext.Current.Request.QueryString[strName]);
                }
                catch
                {
                    Int = intDefault;
                }
            }
            return Int;
        }
        /// <summary>
        /// 获得指定Url参数的值
        /// </summary> 
        /// <param name="strName">Url参数</param>
        /// <param name="sqlSafeCheck">是否进行SQL安全检查</param>
        /// <returns>Url参数的值</returns>
        private static string GetString(string strName)
        {
            if (HttpContext.Current.Request.QueryString[strName] == null)
            {
                return "";
            }
            bool bol = true;
            bol = IsSafeString(HttpContext.Current.Request.QueryString[strName].ToLower());
            if (!bol)
            {
                return "";
            }
            return HttpContext.Current.Request.QueryString[strName];
        }
        // 检查危险字符
        private static bool IsSafeString(string Str)
        {
            string SqlStr = "'|exec|insert|select|delete|update|count|*|chr|mid|master|truncate|char|declare";
            bool ReturnValue = true;
            try
            {
                if (Str != "")
                {
                    string[] anySqlStr = SqlStr.Split('|');
                    foreach (string ss in anySqlStr)
                    {
                        if (Str.IndexOf(ss) >= 0)
                        {
                            ReturnValue = false;
                            break;
                        }
                    }
                }
            }
            catch
            {
                ReturnValue = false;
            }
            return ReturnValue;
        }

        #region 生成guid
        /// <summary>
        /// 生成guid
        /// </summary>
        /// <returns></returns>
        public static string GetGuid()
        {
            return System.Guid.NewGuid().ToString("N").ToLower();
        }
        #endregion
        
        #region 获取本机的MAC
        //获取本机的MAC
        public static string getLocalMac()
        {
            string _ShoppingCart = Basic.Engine.CookieDo.GetCookie("ShoppingCart", "str_key");
            if (string.IsNullOrEmpty(_ShoppingCart))
            {
                string _guid = GetGuid();
                _ShoppingCart = UrlEncode(_guid);
                Basic.Engine.CookieDo.WriteCookie("ShoppingCart", "str_key", _ShoppingCart, 15000000);
            }
            return _ShoppingCart;
        }
        #endregion

        /// 获取网卡物理地址 
        /// </summary> 
        /// <returns></returns> 
        public static string getMacAddr_Local()
        {
            string madAddr = null;
            ManagementClass mc = new ManagementClass("Win32_NetworkAdapterConfiguration");
            ManagementObjectCollection moc2 = mc.GetInstances();
            foreach (ManagementObject mo in moc2)
            {
                if (Convert.ToBoolean(mo["IPEnabled"]) == true)
                {
                    madAddr = mo["MacAddress"].ToString();
                    madAddr = madAddr.Replace(':', '-');
                }
                mo.Dispose();
            }
            return madAddr;
        }

        public static string UrlEncode(string str)
        {
            if (string.IsNullOrEmpty(str))
            {
                return "";
            }
            str = str.Replace("'", "");
            return HttpContext.Current.Server.UrlEncode(str);
        }
    }
}
