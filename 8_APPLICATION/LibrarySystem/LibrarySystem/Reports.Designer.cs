
namespace LibrarySystem
{
    partial class Reports
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.PublAmount = new System.Windows.Forms.Button();
            this.AuthorAm = new System.Windows.Forms.Button();
            this.ExprReader = new System.Windows.Forms.Button();
            this.ReaderName = new System.Windows.Forms.TextBox();
            this.PublNameLabel = new System.Windows.Forms.Label();
            this.authorNameLabel = new System.Windows.Forms.Label();
            this.readerNameLabel = new System.Windows.Forms.Label();
            this.ExpOrders = new System.Windows.Forms.Button();
            this.StatusLabel = new System.Windows.Forms.Label();
            this.DateLabel = new System.Windows.Forms.Label();
            this.OutReport = new System.Windows.Forms.RichTextBox();
            this.dateTimePicker = new System.Windows.Forms.DateTimePicker();
            this.comboPublish = new System.Windows.Forms.ComboBox();
            this.comboAuthor = new System.Windows.Forms.ComboBox();
            this.comboStatus = new System.Windows.Forms.ComboBox();
            this.SuspendLayout();
            // 
            // PublAmount
            // 
            this.PublAmount.Location = new System.Drawing.Point(36, 41);
            this.PublAmount.Name = "PublAmount";
            this.PublAmount.Size = new System.Drawing.Size(150, 47);
            this.PublAmount.TabIndex = 0;
            this.PublAmount.Text = "Подсчет книг изд-ва";
            this.PublAmount.UseVisualStyleBackColor = true;
            this.PublAmount.Click += new System.EventHandler(this.PublAmount_Click);
            // 
            // AuthorAm
            // 
            this.AuthorAm.Location = new System.Drawing.Point(36, 94);
            this.AuthorAm.Name = "AuthorAm";
            this.AuthorAm.Size = new System.Drawing.Size(150, 47);
            this.AuthorAm.TabIndex = 1;
            this.AuthorAm.Text = "Подсчет книг автора";
            this.AuthorAm.UseVisualStyleBackColor = true;
            this.AuthorAm.Click += new System.EventHandler(this.AuthorAm_Click);
            // 
            // ExprReader
            // 
            this.ExprReader.Location = new System.Drawing.Point(36, 147);
            this.ExprReader.Name = "ExprReader";
            this.ExprReader.Size = new System.Drawing.Size(150, 47);
            this.ExprReader.TabIndex = 2;
            this.ExprReader.Text = "Просроченные заказы читателя";
            this.ExprReader.UseVisualStyleBackColor = true;
            this.ExprReader.Click += new System.EventHandler(this.ExprReader_Click);
            // 
            // ReaderName
            // 
            this.ReaderName.Location = new System.Drawing.Point(192, 172);
            this.ReaderName.Name = "ReaderName";
            this.ReaderName.Size = new System.Drawing.Size(193, 22);
            this.ReaderName.TabIndex = 5;
            // 
            // PublNameLabel
            // 
            this.PublNameLabel.AutoSize = true;
            this.PublNameLabel.Location = new System.Drawing.Point(192, 46);
            this.PublNameLabel.Name = "PublNameLabel";
            this.PublNameLabel.Size = new System.Drawing.Size(166, 17);
            this.PublNameLabel.TabIndex = 6;
            this.PublNameLabel.Text = "Название издательства";
            // 
            // authorNameLabel
            // 
            this.authorNameLabel.AutoSize = true;
            this.authorNameLabel.Location = new System.Drawing.Point(192, 99);
            this.authorNameLabel.Name = "authorNameLabel";
            this.authorNameLabel.Size = new System.Drawing.Size(85, 17);
            this.authorNameLabel.TabIndex = 7;
            this.authorNameLabel.Text = "Имя автора";
            // 
            // readerNameLabel
            // 
            this.readerNameLabel.AutoSize = true;
            this.readerNameLabel.Location = new System.Drawing.Point(192, 152);
            this.readerNameLabel.Name = "readerNameLabel";
            this.readerNameLabel.Size = new System.Drawing.Size(87, 17);
            this.readerNameLabel.TabIndex = 8;
            this.readerNameLabel.Text = "ID читателя";
            // 
            // ExpOrders
            // 
            this.ExpOrders.Location = new System.Drawing.Point(596, 160);
            this.ExpOrders.Name = "ExpOrders";
            this.ExpOrders.Size = new System.Drawing.Size(150, 47);
            this.ExpOrders.TabIndex = 9;
            this.ExpOrders.Text = "Вывод штрафов";
            this.ExpOrders.UseVisualStyleBackColor = true;
            this.ExpOrders.Click += new System.EventHandler(this.ExpOrders_Click);
            // 
            // StatusLabel
            // 
            this.StatusLabel.AutoSize = true;
            this.StatusLabel.Location = new System.Drawing.Point(543, 99);
            this.StatusLabel.Name = "StatusLabel";
            this.StatusLabel.Size = new System.Drawing.Size(110, 17);
            this.StatusLabel.TabIndex = 11;
            this.StatusLabel.Text = "Статус штрафа";
            // 
            // DateLabel
            // 
            this.DateLabel.AutoSize = true;
            this.DateLabel.Location = new System.Drawing.Point(543, 46);
            this.DateLabel.Name = "DateLabel";
            this.DateLabel.Size = new System.Drawing.Size(120, 17);
            this.DateLabel.TabIndex = 13;
            this.DateLabel.Text = "Дата (гггг-мм-дд)";
            // 
            // OutReport
            // 
            this.OutReport.Location = new System.Drawing.Point(85, 240);
            this.OutReport.Name = "OutReport";
            this.OutReport.ReadOnly = true;
            this.OutReport.Size = new System.Drawing.Size(610, 152);
            this.OutReport.TabIndex = 14;
            this.OutReport.Text = "";
            // 
            // dateTimePicker
            // 
            this.dateTimePicker.Location = new System.Drawing.Point(546, 66);
            this.dateTimePicker.Name = "dateTimePicker";
            this.dateTimePicker.Size = new System.Drawing.Size(200, 22);
            this.dateTimePicker.TabIndex = 15;
            this.dateTimePicker.ValueChanged += new System.EventHandler(this.dateTimePicker1_ValueChanged);
            // 
            // comboPublish
            // 
            this.comboPublish.FormattingEnabled = true;
            this.comboPublish.Location = new System.Drawing.Point(195, 64);
            this.comboPublish.Name = "comboPublish";
            this.comboPublish.Size = new System.Drawing.Size(190, 24);
            this.comboPublish.TabIndex = 16;
            this.comboPublish.SelectedIndexChanged += new System.EventHandler(this.comboPublish_SelectedIndexChanged);
            // 
            // comboAuthor
            // 
            this.comboAuthor.FormattingEnabled = true;
            this.comboAuthor.Location = new System.Drawing.Point(195, 117);
            this.comboAuthor.Name = "comboAuthor";
            this.comboAuthor.Size = new System.Drawing.Size(190, 24);
            this.comboAuthor.TabIndex = 17;
            // 
            // comboStatus
            // 
            this.comboStatus.FormattingEnabled = true;
            this.comboStatus.Location = new System.Drawing.Point(546, 117);
            this.comboStatus.Name = "comboStatus";
            this.comboStatus.Size = new System.Drawing.Size(200, 24);
            this.comboStatus.TabIndex = 18;
            // 
            // Reports
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 440);
            this.Controls.Add(this.comboStatus);
            this.Controls.Add(this.comboAuthor);
            this.Controls.Add(this.comboPublish);
            this.Controls.Add(this.dateTimePicker);
            this.Controls.Add(this.OutReport);
            this.Controls.Add(this.DateLabel);
            this.Controls.Add(this.StatusLabel);
            this.Controls.Add(this.ExpOrders);
            this.Controls.Add(this.readerNameLabel);
            this.Controls.Add(this.authorNameLabel);
            this.Controls.Add(this.PublNameLabel);
            this.Controls.Add(this.ReaderName);
            this.Controls.Add(this.ExprReader);
            this.Controls.Add(this.AuthorAm);
            this.Controls.Add(this.PublAmount);
            this.Name = "Reports";
            this.Text = "Отчеты";
            this.Load += new System.EventHandler(this.Reports_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button PublAmount;
        private System.Windows.Forms.Button AuthorAm;
        private System.Windows.Forms.Button ExprReader;
        private System.Windows.Forms.TextBox ReaderName;
        private System.Windows.Forms.Label PublNameLabel;
        private System.Windows.Forms.Label authorNameLabel;
        private System.Windows.Forms.Label readerNameLabel;
        private System.Windows.Forms.Button ExpOrders;
        private System.Windows.Forms.Label StatusLabel;
        private System.Windows.Forms.Label DateLabel;
        private System.Windows.Forms.RichTextBox OutReport;
        private System.Windows.Forms.DateTimePicker dateTimePicker;
        private System.Windows.Forms.ComboBox comboPublish;
        private System.Windows.Forms.ComboBox comboAuthor;
        private System.Windows.Forms.ComboBox comboStatus;
    }
}