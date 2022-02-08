using System;
using System.Configuration;
using System.Diagnostics;
using System.IO;
using System.Reflection;
using System.Text;
using System.Windows.Forms;
using Microsoft.WindowsAPICodePack.Dialogs;

namespace streaming_dl_helper
{
    public partial class Form1 : Form
    {
        public delegate void MyEventHandler(object sender, DataReceivedEventArgs e);
        public event MyEventHandler myEvent = null;
        Process process = null;
        //private ReceivedEventHandler

        public Form1()
        {
            InitializeComponent();
            SaveFolderInput.Text = ConfigurationManager.AppSettings["saveDir"];
        }

        void event_DataReceived(object sender, DataReceivedEventArgs e)
        {
            textBox1.Text += e.Data + "\r\n";
            //カレット位置を末尾に移動
            textBox1.SelectionStart = textBox1.Text.Length;
            //テキストボックスにフォーカスを移動
            textBox1.Focus();
            //カレット位置までスクロール
            textBox1.ScrollToCaret();
        }

        void process_DataReceived(object sender, DataReceivedEventArgs e)
        {
            //Console.WriteLine(e.Data);  
            this.Invoke(myEvent, new object[2] { sender, e });
        }

        private void Form1_FormClosed(object sender, FormClosedEventArgs e)
        {
            try
            {
                if (process != null)
                {
                    process.Kill();
                    process.Close();
                    process.Dispose();
                }
            }
            catch (InvalidOperationException exc)
            {
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            string input = arg_input.Text;
            string dir = SaveFolderInput.Text;
            if (dir != "")
            {
                string argment = input.Replace("--output \"", "--output \"" + dir + @"\");
                exec(argment);
            } else
            {
                exec(input);
            }
        }

        private void exec (string _argument)
        {
            myEvent = new MyEventHandler(event_DataReceived);

            process = new Process();

            //process.StartInfo.FileName = apppath + @"\ExecConsole\bin\Debug\ExecConsole.exe";
            string dir = Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location);
            process.StartInfo.FileName = dir + @"\scripts\run.cmd";
            process.StartInfo.Arguments = _argument;
            process.StartInfo.UseShellExecute = false;
            process.StartInfo.CreateNoWindow = true;
            process.StartInfo.RedirectStandardOutput = true; // 標準出力をリダイレクト
            process.StartInfo.StandardOutputEncoding = Encoding.UTF8;
            process.OutputDataReceived += new DataReceivedEventHandler(process_DataReceived);

            process.Start();
            process.BeginOutputReadLine();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            using (var cofd = new CommonOpenFileDialog()
            {
                Title = "フォルダを選択してください",
                InitialDirectory = @"D:\Users\threeshark",
                // フォルダ選択モードにする
                IsFolderPicker = true,
            })
            {
                if (cofd.ShowDialog() != CommonFileDialogResult.Ok)
                {
                    return;
                }

                // FileNameで選択されたフォルダを取得する
                // FileNameで選択されたフォルダを取得する
                //System.Windows.MessageBox.Show($"{cofd.FileName}を選択しました");

                SaveFolderInput.Text = cofd.FileName;
            }
        }

        private void linkLabel2_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            Process.Start("EXPLORER.EXE", SaveFolderInput.Text);
        }

        private void button3_Click(object sender, EventArgs e)
        {
            string myText = Clipboard.GetText();
            arg_input.Text = myText;
        }

        private void clear_chache_Click(object sender, EventArgs e)
        {
            exec("minyami --clear");
        }

        private void button4_Click(object sender, EventArgs e)
        {
            Configuration config = ConfigurationManager.OpenExeConfiguration(ConfigurationUserLevel.None);
            config.AppSettings.Settings["saveDir"].Value = SaveFolderInput.Text;
            config.Save();
        }

        private void 使用上の注意ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            caution redirect = new caution();
            redirect.Show();
        }

        private void バージョンアップデートToolStripMenuItem_Click(object sender, EventArgs e)
        {
            about redirect = new about();
            redirect.Show();
        }

        private void ホームページご意見などToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Process.Start("explorer.exe", "https://tools.ic731.net/stream_dl");
        }
    }
}
