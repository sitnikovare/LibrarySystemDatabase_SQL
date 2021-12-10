
namespace LibrarySystem
{
    partial class BookCard
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
            this.label1 = new System.Windows.Forms.Label();
            this.title = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.authorID = new System.Windows.Forms.TextBox();
            this.genreID = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.AddBook = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(74, 56);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(72, 17);
            this.label1.TabIndex = 0;
            this.label1.Text = "Название";
            // 
            // title
            // 
            this.title.Location = new System.Drawing.Point(77, 76);
            this.title.Name = "title";
            this.title.Size = new System.Drawing.Size(205, 22);
            this.title.TabIndex = 1;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(74, 124);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(71, 17);
            this.label2.TabIndex = 2;
            this.label2.Text = "ID автора";
            // 
            // authorID
            // 
            this.authorID.Location = new System.Drawing.Point(77, 144);
            this.authorID.Name = "authorID";
            this.authorID.Size = new System.Drawing.Size(205, 22);
            this.authorID.TabIndex = 3;
            // 
            // genreID
            // 
            this.genreID.Location = new System.Drawing.Point(77, 209);
            this.genreID.Name = "genreID";
            this.genreID.Size = new System.Drawing.Size(205, 22);
            this.genreID.TabIndex = 5;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(74, 189);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(66, 17);
            this.label3.TabIndex = 4;
            this.label3.Text = "ID жанра";
            // 
            // AddBook
            // 
            this.AddBook.Location = new System.Drawing.Point(89, 275);
            this.AddBook.Name = "AddBook";
            this.AddBook.Size = new System.Drawing.Size(183, 64);
            this.AddBook.TabIndex = 6;
            this.AddBook.Text = "Добавить";
            this.AddBook.UseVisualStyleBackColor = true;
            this.AddBook.Click += new System.EventHandler(this.AddBook_Click);
            // 
            // BookCard
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(373, 390);
            this.Controls.Add(this.AddBook);
            this.Controls.Add(this.genreID);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.authorID);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.title);
            this.Controls.Add(this.label1);
            this.Name = "BookCard";
            this.Text = "Карта книги";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox title;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox authorID;
        private System.Windows.Forms.TextBox genreID;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Button AddBook;
    }
}