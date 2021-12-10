
namespace LibrarySystem
{
    partial class ReadDirs
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
            this.Author = new System.Windows.Forms.Button();
            this.Genres = new System.Windows.Forms.Button();
            this.Publish = new System.Windows.Forms.Button();
            this.Books = new System.Windows.Forms.Button();
            this.Readers = new System.Windows.Forms.Button();
            this.TableViewer = new System.Windows.Forms.RichTextBox();
            this.SuspendLayout();
            // 
            // Author
            // 
            this.Author.Location = new System.Drawing.Point(43, 43);
            this.Author.Name = "Author";
            this.Author.Size = new System.Drawing.Size(139, 53);
            this.Author.TabIndex = 0;
            this.Author.Text = "Авторы";
            this.Author.UseVisualStyleBackColor = true;
            this.Author.Click += new System.EventHandler(this.Author_Click);
            // 
            // Genres
            // 
            this.Genres.Location = new System.Drawing.Point(43, 102);
            this.Genres.Name = "Genres";
            this.Genres.Size = new System.Drawing.Size(139, 53);
            this.Genres.TabIndex = 1;
            this.Genres.Text = "Жанры";
            this.Genres.UseVisualStyleBackColor = true;
            this.Genres.Click += new System.EventHandler(this.Genres_Click);
            // 
            // Publish
            // 
            this.Publish.Location = new System.Drawing.Point(43, 161);
            this.Publish.Name = "Publish";
            this.Publish.Size = new System.Drawing.Size(139, 53);
            this.Publish.TabIndex = 2;
            this.Publish.Text = "Издательства";
            this.Publish.UseVisualStyleBackColor = true;
            this.Publish.Click += new System.EventHandler(this.Publish_Click);
            // 
            // Books
            // 
            this.Books.Location = new System.Drawing.Point(43, 220);
            this.Books.Name = "Books";
            this.Books.Size = new System.Drawing.Size(139, 53);
            this.Books.TabIndex = 3;
            this.Books.Text = "Книги";
            this.Books.UseVisualStyleBackColor = true;
            this.Books.Click += new System.EventHandler(this.Books_Click);
            // 
            // Readers
            // 
            this.Readers.Location = new System.Drawing.Point(43, 279);
            this.Readers.Name = "Readers";
            this.Readers.Size = new System.Drawing.Size(139, 53);
            this.Readers.TabIndex = 4;
            this.Readers.Text = "Читатели";
            this.Readers.UseVisualStyleBackColor = true;
            this.Readers.Click += new System.EventHandler(this.Readers_Click);
            // 
            // TableViewer
            // 
            this.TableViewer.Location = new System.Drawing.Point(245, 45);
            this.TableViewer.Name = "TableViewer";
            this.TableViewer.ReadOnly = true;
            this.TableViewer.Size = new System.Drawing.Size(1138, 466);
            this.TableViewer.TabIndex = 5;
            this.TableViewer.Text = "";
            // 
            // ReadDirs
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1416, 547);
            this.Controls.Add(this.TableViewer);
            this.Controls.Add(this.Readers);
            this.Controls.Add(this.Books);
            this.Controls.Add(this.Publish);
            this.Controls.Add(this.Genres);
            this.Controls.Add(this.Author);
            this.Name = "ReadDirs";
            this.Text = "Просмотр справочников";
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button Author;
        private System.Windows.Forms.Button Genres;
        private System.Windows.Forms.Button Publish;
        private System.Windows.Forms.Button Books;
        private System.Windows.Forms.Button Readers;
        private System.Windows.Forms.RichTextBox TableViewer;
    }
}