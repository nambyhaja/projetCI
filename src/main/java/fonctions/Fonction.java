package fonctions;

import java.sql.Time;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class Fonction 
{
    // Controle Date
    public static int controleAnnee(String annee) throws Exception
    {
        try
        {   
            return Integer.parseInt(annee);
        }
        catch(NumberFormatException ne)
        {
            throw new Exception("Annee invalide");
        }
    }
        
        // Retourne un java.sql.Date depuis une date de n'importe quelle format
    public static String creationFormatDate(String date,String[] freqFormat)
    {
        int i=0;
        
        String[] splitDate=date.split("-");
        String rep="";
        //String[] freq={"d","M","y"};
        for(i=0;i<splitDate.length;i++)
        {   
            for(int j=0;j<splitDate[i].length();j++)
            {
                rep=rep+freqFormat[i];
            }
            if(i+1!=splitDate.length)
            {
                rep=rep+"-";
            }
        }
        return rep;
    }
    
    public static java.sql.Date getSqlDate(String date) throws Exception
    {
        int i=0;
        String[] seps = {".","/","-"," "};
        for(i=0;i<seps.length;i++)
        {
            date = date.replace(seps[i], seps[2]);
        }
        date = date.toLowerCase();
        try
        {
            String[] freq={"d","M","y"};
            String format=Fonction.creationFormatDate(date,freq);
            DateFormat df = new SimpleDateFormat(format);
            df.setLenient(false);
            java.util.Date dateUtil= df.parse(date);
            java.sql.Date rep = new java.sql.Date(dateUtil.getTime());
            return rep;
        }
        catch(Exception ex)
        {
            throw new Exception("Date invalide");
        }      
    }
    
    public static java.util.Date getUtilDate(String date) throws Exception
    {
        int i=0;
        String[] seps = {".","/","-"," "};
        for(i=0;i<seps.length;i++)
        {
            date = date.replace(seps[i], seps[2]);
        }
        date = date.toLowerCase();
        try
        {
            String[] freq={"d","M","y"};
            String format=Fonction.creationFormatDate(date,freq);
            DateFormat df = new SimpleDateFormat(format);
            df.setLenient(false);
            java.util.Date dateUtil= df.parse(date);
            return dateUtil;
        }
        catch(Exception ex)
        {
            throw new Exception("Date invalide");
        }      
    }
    
    public static int getAnnee(java.sql.Date date)
    {
        String dateString = date.toString();
        String[] dateSplit = dateString.split("-");   
        return Integer.parseInt(dateSplit[0]);
    }
    
        // Retourne les dates d'une semaine donnee (ex : semaine du 31 janvier 2017)
    public static java.sql.Date[] getJourSemaine(String jour) throws Exception
    {
        java.sql.Date[] rep = new java.sql.Date[7];
        Calendar cal = Calendar.getInstance();
        java.util.Date dateUtil = Fonction.getUtilDate(jour);
        cal.setTime(dateUtil);
        int indice = 0;
        for(int i = Calendar.MONDAY; i <= Calendar.SATURDAY; i++) 
        {
            cal.set(Calendar.DAY_OF_WEEK, i);
            java.util.Date d=cal.getTime();
            java.sql.Date dSql = new java.sql.Date(d.getTime());
            rep[indice]=dSql;
            indice++;
        }
        cal.set(Calendar.DAY_OF_WEEK, Calendar.SUNDAY);
        java.util.Date d=cal.getTime();
        java.sql.Date dSql = new java.sql.Date(d.getTime());
        rep[6]=dSql;
        
        return rep;
    }
    
    // Controle Heure
    public static String creationFormatHeure(String heure)
    {
        String nheure=heure.toLowerCase();
        String[] freq=new String[2];
        freq[0]="k";
        freq[1]="m";
        if(nheure.contains("am") || nheure.contains("pm"))
        {
            freq[0]="h";
            freq[1]="m";
        }     
        String[] splitHeure=nheure.split(":");
        int i=0;
        String rep="";
        String extra="aa";
        for(i=0;i<splitHeure.length;i++)
        {
            for(int j=0;j<splitHeure[i].length();j++)
            {
                if(splitHeure[i].charAt(j)==' ')
                {
                    rep=rep+" "+extra;
                    break;
                }
                rep=rep+freq[i];
            }
            if(i+1!=splitHeure.length)
            {
                rep=rep+":";
            }
        }
        if(!rep.contains("m"))
        {
            rep+=":m";
        }
        return rep;
    }
    public static Time getHeure(String heure) throws Exception
    {
        try 
        {
            heure = heure.toLowerCase();
            heure = heure.replace('h', ':');
            String format=Fonction.creationFormatHeure(heure);
            DateFormat df = new SimpleDateFormat(format);
            df.setLenient(false);
            long ms = df.parse(heure+":00").getTime();
            Time rep = new Time(ms);
            return rep;
        } 
        catch (Exception ex) 
        {
            throw new Exception("Heure invalide");
        }
    }
    public static Time soustractionTime(Time heure1,Time heure2)
    {
        int h = (heure1.getHours()*3600)-(heure2.getHours()*3600);
        int mn = (heure1.getMinutes()*60)-(heure2.getMinutes()*60);
   
        return new Time(0,0,h+mn);
    }
    public static Time additionTime(Time heure1,Time heure2)
    {
        int h = (heure1.getHours()*3600)+(heure2.getHours()*3600);
        int mn = (heure1.getMinutes()*60)+(heure2.getMinutes()*60);
 
        return new Time(0,0,h+mn);
    }
    public static int toSecond(Time times)
    {
        int h = times.getHours();
        int mn = times.getMinutes();
        
        return (h*3600)+(mn*60);
    }
    public static int toHeure(Time times)
    {
        int s = Fonction.toSecond(times);
        return s/3600;
    }
    public static String toString(Time times)
    {
        String t = times.toString();
        t = t.replace(":", "h");
        
        return t.substring(0, 5);
    }
    
    public static void estVide(String str,String erreur) throws Exception
    {
        if(str.isEmpty())
        {
            throw new Exception(erreur);
        }
    }
    
    public static void finiPar(String str,String end) throws Exception
    {
        if(!str.endsWith(end))
        {
            throw new Exception("Veuillez uploader un fichier "+end);
        }
    }
}
